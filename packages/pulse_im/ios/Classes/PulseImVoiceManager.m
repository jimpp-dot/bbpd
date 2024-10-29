//
//  RCTRongCloudVoiceManager.m
//  RCTRongCloud
//
//  Created by LvBingru on 4/18/16.
//  Copyright © 2016 erica. All rights reserved.
//

#import "PulseImVoiceManager.h"
#import <AVFoundation/AVAudioRecorder.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <AVFoundation/AVAudioSession.h>

@interface PulseImVoiceManager ()<AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioRecorder *recorder;
@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic, strong) NSString *recordWavFilePath;
@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, copy) RCVoiceResultBlock finishRecordBlock;
@property (nonatomic, copy) RCVoiceResultBlock finishPlayBlock;

@property (nonatomic, strong) NSTimer* peekTimer;

@end


@implementation PulseImVoiceManager


- (void)dealloc
{
    [self.player setDelegate:nil];
    [self.recorder setDelegate:nil];
    
    if (self.player && self.player.isPlaying)
    {
        [self.player stop];
    }
    
    if (self.recorder && self.recorder.isRecording)
    {
        [self.recorder stop];
    }
}


- (void)canRecordVoice:(RCVoiceResultBlock)result
{
    if ([AVAudioSession sharedInstance].recordPermission == AVAudioSessionRecordPermissionUndetermined) {
        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
            result(nil, @{@"granted": @(granted)});
        }];
    }else{
        BOOL granted = ([AVAudioSession sharedInstance].recordPermission == AVAudioSessionRecordPermissionGranted);
        result(nil, @{@"granted": @(granted)});

    }
}

- (void)startRecord:(RCVoiceResultBlock)result;
{
    [self cancelRecord];
    
    
    NSError *error = nil;
    // 初始化
    if (self.recorder == nil)
    {
        error = [self _prepareRecorder];
        if (error) {
            result(error, nil);
            return;
        }
    }
    [self.recorder setDelegate:self];

    // 设置环境
    error = [[self class] activeAudioSessionWithCategory:AVAudioSessionCategoryPlayAndRecord withOptions:AVAudioSessionCategoryOptionDefaultToSpeaker];
    if (error) {
        result(error, nil);
        return;
    }
    
    // 准备录音
    BOOL success = [self.recorder prepareToRecord];
    if (!success) {
        result([self _errorWithMessage:@"recorder prepareToRecord failed"], nil);
        return;
    }
    
    // 开始录音
    success = [self.recorder record];
    if (!success) {
        result([self _errorWithMessage:@"record failed"], nil);
        return;
    }
    
    // 定期获取录音时间
    [self _startPeekTimer];
    
    [self setFinishRecordBlock:result];
}

- (void)startPlayVoice:(NSData *)voiceData result:(RCVoiceResultBlock)result
{
    [self cancelPlay];
    
    // 初始化
    NSError *error = [self _preparePlayer:voiceData];
    if (error) {
        result(error, nil);
        return;
    }
    
    if (self.player == nil)
    {
        result([self _errorWithMessage:@"player null"], nil);
        return;
    }
    
    [self.player setDelegate:self];
    
    // 配置环境
    error = [[self class] activeAudioSessionWithCategory:AVAudioSessionCategoryPlayAndRecord withOptions:(AVAudioSessionCategoryOptionDefaultToSpeaker | AVAudioSessionCategoryOptionAllowBluetooth)];
    if (error) {
        result(error, nil);
        return;
    }
    
    // 准备播放
    BOOL success = [self.player prepareToPlay];
    if (!success) {
        result([self _errorWithMessage:@"player prepareToPlay failed"], nil);
        return;
    }
    
    // 开始播放
    success = [self.player play];
    if (!success) {
        result([self _errorWithMessage:@"play failed"], nil);
        return;
    }
    
    [self setFinishPlayBlock:result];
    
    [self handleProximityMonitoring:YES];
    
}


- (void)cancelRecord
{
    [self _endPeektimer];
    
    if (self.finishRecordBlock) {
        [self.recorder setDelegate:nil];
        
        [self.recorder stop];
        self.finishRecordBlock([self _errorWithMessage:@"recorder cancelled"], nil);
        [self setFinishRecordBlock:nil];
        [[self class] deactiveAudioSession];
    }
}

- (void)finishRecord
{
    [self _endPeektimer];
    
    if (!self.recorder.recording) {
        [self cancelRecord];
    }
    else {
        [self setDuration:self.recorder.currentTime];
        [self.recorder stop];
    }
}

- (void)cancelPlay
{
    if (self.finishPlayBlock) {
        [self.recorder setDelegate:nil];
        [self.recorder stop];
        
        self.finishPlayBlock([self _errorWithMessage:@"play cancelled"], nil);
        [self setFinishPlayBlock:nil];
        
        [self handleProximityMonitoring:NO];

        [[self class] deactiveAudioSession];
    }
}

- (void)stopPlayVoice
{
    if (!self.player.isPlaying) {
        [self cancelPlay];
    }
    else {
        [self.player stop];
    }
    
    [self handleProximityMonitoring:NO];

}

#pragma mark - 监听听筒or扬声器
- (void) handleProximityMonitoring:(BOOL)state
{
    [[UIDevice currentDevice] setProximityMonitoringEnabled:state]; //建议在播放之前设置yes，播放结束设置NO，这个功能是开启红外感应
    
    if(state)//添加监听
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(sensorStateChange:) name:@"UIDeviceProximityStateDidChangeNotification"
                                                   object:nil];
    else//移除监听
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UIDeviceProximityStateDidChangeNotification" object:nil];
}

//处理监听触发事件
-(void)sensorStateChange:(NSNotificationCenter *)notification;
{
    //如果此时手机靠近面部放在耳朵旁，那么声音将通过听筒输出，并将屏幕变暗（省电啊）
    if ([[UIDevice currentDevice] proximityState] == YES)
    {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    }
    else
    {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
}


#pragma mark - Peek Timer

- (void)_startPeekTimer
{
    [self _endPeektimer];
    
    if (self.peekBlock) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.peekTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                       target:self
                                                     selector:@selector(_peekFired:)
                                                     userInfo:nil
                                                      repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:self.peekTimer forMode:NSRunLoopCommonModes];
        });
    }
}

- (void)_endPeektimer
{
    if (!self.peekTimer) return;
    

    [self.peekTimer invalidate];
    self.peekTimer = nil;
}

- (void)_peekFired:(NSTimer *)timer
{
    if (self.peekBlock) {
        self.peekBlock(self.recorder.currentTime);
    }
}


#pragma mark - private


- (NSError *)_prepareRecorder
{
    //初始化录音
    NSDictionary *settings = @{AVFormatIDKey: @(kAudioFormatLinearPCM),
                               AVSampleRateKey: @8000.00f,
                               AVNumberOfChannelsKey: @1,
                               AVLinearPCMBitDepthKey: @16,
                               AVLinearPCMIsNonInterleaved: @NO,
                               AVLinearPCMIsFloatKey: @NO,
                               AVLinearPCMIsBigEndianKey: @NO};
    
    NSString *tempPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];

    NSString *savePath = [tempPath stringByAppendingPathComponent:[NSString stringWithFormat:@"tempRecorderVoice%lld", (long long)([[NSDate date] timeIntervalSince1970]*1000)]];
    [self setRecordWavFilePath:savePath];
    
    NSURL *outputFileURL = [NSURL fileURLWithPath:self.recordWavFilePath];
    
    NSError *error;
    AVAudioRecorder *recoder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:settings  error:&error];
    if (error)
    {
        return error;
    }
    
    [self setRecorder:recoder];
    return nil;
}

- (NSError *)_preparePlayer:(NSData *)voiceData
{
    NSError *error = nil;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithData:voiceData error:&error];
    
    if (error)
    {
        [self setPlayer:nil];
        return error;
    }
    [self setPlayer:player];
    
    return nil;
}

- (NSError *)_errorWithMessage:(NSString *)errorMessage
{
    return [NSError errorWithDomain:@"cn.reactnative.rongcloud"
                               code:-1
                           userInfo:@{ NSLocalizedDescriptionKey: errorMessage}];
}


#pragma mark - Recorder Delegate
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag
{

    if (self.finishRecordBlock) {
        if (flag == YES)
        {
            NSData *data = [NSData dataWithContentsOfFile:self.recordWavFilePath];
            NSString *base64 = [data base64EncodedStringWithOptions:0];
            NSDictionary *body = @{
                                   @"base64":base64,
                                   @"type":@"voice",
                                   @"duration":@(self.duration)
                                   };
            
            self.finishRecordBlock(nil,body);
            [self setFinishRecordBlock:nil];
        }
        else
        {
            self.finishRecordBlock([self _errorWithMessage:@"record failed"], nil);
            [self setFinishRecordBlock:nil];
        }
    }
    [[self class] deactiveAudioSession];
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    
    if (self.finishRecordBlock) {
        self.finishRecordBlock([self _errorWithMessage:@"record failed"], nil);
        [self setFinishRecordBlock:nil];
    }
    [[self class] deactiveAudioSession];
}

#pragma mark - Player Delegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self handleProximityMonitoring:NO];

    if (self.finishPlayBlock) {
        if (flag == YES)
        {
            self.finishPlayBlock(nil, nil);
            [self setFinishPlayBlock:nil];
        }
        else
        {
            self.finishPlayBlock([self _errorWithMessage:@"play failed"], nil);
            [self setFinishPlayBlock:nil];
        }
    }
    [[self class] deactiveAudioSession];
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    [self handleProximityMonitoring:NO];

    if (self.finishPlayBlock) {
        self.finishPlayBlock([self _errorWithMessage:@"play failed"], nil);
        [self setFinishPlayBlock:nil];
    }
    [[self class] deactiveAudioSession];
}

#pragma mark - context

+ (NSError *)activeAudioSession
{
    NSError *error = nil;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
    [audioSession setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:&error];
    
    return error;
}

+ (NSError *)deactiveAudioSession
{
    NSError *error = nil;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:&error];
    return error;
}

+ (NSError *)activeAudioSessionWithCategory:(NSString*)category withOptions:(AVAudioSessionCategoryOptions)options
{
    NSError *error = nil;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
    if(!options)
    {
        [audioSession setCategory:category error:&error];
    }
    else
    {
        [audioSession setCategory:category withOptions:options error:&error];
    }
    
    if(!error)
    {
        [audioSession setActive:YES withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:&error];
    }
    return error;
}

+ (NSError *)deactiveAudioSessionWithCategory:(NSString*)category
{
    NSError *error = nil;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    BOOL ret = [audioSession setCategory:category error:&error];
    
    if(ret)
    {
        [audioSession setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:&error];
    }
    return error;
}


@end
