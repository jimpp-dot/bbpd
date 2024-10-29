// QGAnimatedImageDecodeManager.m
// Tencent is pleased to support the open source community by making vap available.
//
// Copyright (C) 2020 THL A29 Limited, a Tencent company.  All rights reserved.
//
// Licensed under the MIT License (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
//
// http://opensource.org/licenses/MIT
//
// Unless required by applicable law or agreed to in writing, software distributed under the License is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions and
// limitations under the License.

#import "CommonQGAnimatedImageDecodeManager.h"
#import "CommonQGAnimatedImageBufferManager.h"
#import "CommonQGBaseDecoder.h"
#import "CommonQGVAPSafeMutableArray.h"
#import "CommonQGMP4FrameHWDecoder.h"
#import "CommonQGVAPLogger.h"
#import <sys/stat.h>
#import <AVFoundation/AVFoundation.h>

@interface CommonQGAnimatedImageDecodeManager() {

    CommonQGAnimatedImageDecodeConfig *_config;           //解码配置
    CommonQGBaseDFileInfo *_fileInfo;                     //sharpP文件信息
    NSMutableArray *_decoders;                      //解码器
    CommonQGAnimatedImageBufferManager *_bufferManager;   //缓冲管理
    AVAudioPlayer *_audioPlayer;
}

@end

@implementation CommonQGAnimatedImageDecodeManager

- (instancetype)initWith:(CommonQGBaseDFileInfo *)fileInfo
                  config:(CommonQGAnimatedImageDecodeConfig *)config
                delegate:(id<CommonQGAnimatedImageDecoderDelegate>)delegate {

    if (self = [super init]) {
        
        _config = config;
        _fileInfo = fileInfo;
        _decoderDelegate = delegate;
        [self createDecodersByConfig:config];
        _bufferManager = [[CommonQGAnimatedImageBufferManager alloc] initWithConfig:config];
        [self initializeBuffersFromIndex:0];
        [self setupAudioPlayerIfNeed];
    }
    return self;
}

/**
 取出已解码的一帧并准备下一帧
 
 @param frameIndex 帧索引
 @return 帧内容
 */
- (CommonQGBaseAnimatedImageFrame *)consumeDecodedFrame:(NSInteger)frameIndex {

    @synchronized (self) {
        // 控制何时命中第一帧，缓存满了才命中
        if (frameIndex == 0 && _bufferManager.buffers.count < _config.bufferCount) {
            return nil;
        }
        BOOL decodeFinish = [self checkIfDecodeFinish:frameIndex];
        CommonQGBaseAnimatedImageFrame *frame = [_bufferManager popVideoFrame];
        if (frame) {
            // pts顺序
            frame.frameIndex = frameIndex;
            [self decodeFrame:frameIndex+_config.bufferCount];
        }
        else if (!decodeFinish){
            // buffer已经空了，但还没有结束（退后台时可能出现这种情况）
            NSInteger decoderIndex = _decoders.count==1?0:frameIndex%_decoders.count;
            CommonQGBaseDecoder *decoder = _decoders[decoderIndex];
            if ([decoder shouldStopDecode:frameIndex]) {
                // 其实已经该结束了
                if ([self.decoderDelegate respondsToSelector:@selector(decoderDidFinishDecode:)]) {
                    [self.decoderDelegate decoderDidFinishDecode:decoder];
                }
                return nil;
            }
            
            [self initializeBuffersFromIndex:frameIndex];
        }
        return frame;
    }
}

- (void)tryToStartAudioPlay {
    if (!_audioPlayer) {
        return ;
    }
    [_audioPlayer play];
}

- (void)tryToStopAudioPlay {
    if (!_audioPlayer) {
        return;
    }
    // CoreAudio（AVAudioPlaeyrCpp）回调audioPlayerDidFinishPlaying:successfully:时在子线程，恰巧此时释放将可能导致野指针问题
    // 如果只是stop不能解决，可以考虑产生循环持有并延迟释放_audioPlayer
    [_audioPlayer stop];
}

- (void)tryToPauseAudioPlay {
    if (!_audioPlayer) {
        return;
    }
    [_audioPlayer pause];
}

- (void)tryToResumeAudioPlay {
    if (!_audioPlayer) {
        return;
    }
    [_audioPlayer play];
}

#pragma mark - private methods

- (BOOL)checkIfDecodeFinish:(NSInteger)frameIndex {
    
    NSInteger decoderIndex = _decoders.count==1?0:frameIndex%_decoders.count;
    CommonQGBaseDecoder *decoder = _decoders[decoderIndex];
    if ([decoder isFrameIndexBeyondEnd:frameIndex]) {
        if ([self.decoderDelegate respondsToSelector:@selector(decoderDidFinishDecode:)]) {
            [self.decoderDelegate decoderDidFinishDecode:decoder];
        }
        return YES;
    }
    return NO;
}

- (void)decodeFrame:(NSInteger)frameIndex {

    if (!_decoders || _decoders.count == 0) {
        //NSLog(@"error! can't find decoder");
        return ;
    }
    NSInteger decoderIndex = _decoders.count==1?0:frameIndex%_decoders.count;
    CommonQGBaseDecoder *decoder = _decoders[decoderIndex];
    if ([decoder shouldStopDecode:frameIndex]) {
        return ;
    }
    [decoder decodeFrame:frameIndex buffers:_bufferManager.buffers];
}

- (void)createDecodersByConfig:(CommonQGAnimatedImageDecodeConfig *)config {

    if (!self.decoderDelegate || ![self.decoderDelegate respondsToSelector:@selector(decoderClassForManager:)]) {
        VAP_Event(kQGVAPModuleCommon, @"you MUST implement the delegate in invoker!");
        NSAssert(0, @"you MUST implement the delegate in invoker!");
        return ;
    }
    
    _decoders = [CommonQGVAPSafeMutableArray new];
    for (int i = 0; i < config.threadCount; i ++) {
        Class class = [self.decoderDelegate decoderClassForManager:self];
        NSError *error = nil;
        CommonQGBaseDecoder *decoder = [class alloc];
        decoder = [decoder initWith:_fileInfo error:&error];
        if (!decoder) {
            if ([self.decoderDelegate respondsToSelector:@selector(decoderDidFailDecode:error:)]) {
                [self.decoderDelegate decoderDidFailDecode:nil error:error];
            }
            break ;
        }
        [_decoders addObject:decoder];
    }
}

- (void)initializeBuffersFromIndex:(NSInteger)start {
    
    for (int i = 0; i < _config.bufferCount; i++) {
        [self decodeFrame:start+i];
    }
}

- (void)setupAudioPlayerIfNeed {
    if ([_decoderDelegate respondsToSelector:@selector(shouldSetupAudioPlayer)]) {
        BOOL should = [_decoderDelegate shouldSetupAudioPlayer];
        if (!should) {
            return;
        }
    }
    
    if ([_fileInfo isKindOfClass:[CommonQGMP4HWDFileInfo class]]) {
        CommonQGMP4ParserProxy *mp4Parser = [(CommonQGMP4HWDFileInfo *)_fileInfo mp4Parser];
        if (!mp4Parser.audioTrackBox) {
            _audioPlayer = nil;
            return ;
        }
        NSError *error;
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:_fileInfo.filePath] error:&error];
    }
}

- (void)dealloc {
    _audioPlayer = nil;
}

- (BOOL)containsThisDeocder:(id)decoder {
    for (id d in _decoders) {
        if (d == decoder) {
            return YES;
        }
    }
    return NO;
}

@end
