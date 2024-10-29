// QGVAPMetalView.m
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

#import "CommonQGVAPMetalView.h"
#import "CommonQGVAPMetalRenderer.h"
#import "CommonQGVAPLogger.h"

#if TARGET_OS_SIMULATOR//模拟器

@implementation CommonQGVAPMetalView

- (void)display:(CVPixelBufferRef)pixelBuffer mergeInfos:(NSArray<CommonQGVAPMergedInfo *> *)infos {}

- (void)dispose {}

@end

#else

@interface CommonQGVAPMetalView ()

@property (nonatomic, strong) CommonQGVAPMetalRenderer *renderer;
@property (nonatomic, assign) BOOL               drawableSizeShouldUpdate;
@property (nonatomic, assign) CGSize             size;
@end

@implementation CommonQGVAPMetalView

#pragma mark - override

+ (Class)layerClass {
    return [CAMetalLayer class];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSAssert(0, @"initWithCoder: has not been implemented");
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (instancetype)initWithSize:(CGSize)size {
    if (self = [super init]) {
        _size = size;
    }
    
    return self;
}

- (CommonQGVAPMetalRenderer *)renderer {
    if (_renderer == nil) {
        _renderer = [[CommonQGVAPMetalRenderer alloc] initWithSize: self.size];
    }
    return _renderer;
}

- (void)setTextureId:(NSInteger)textureId {
    _textureId = textureId;
    _renderer.textureId = textureId;
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    self.drawableSizeShouldUpdate = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.drawableSizeShouldUpdate = YES;
}

- (void)dealloc {
    [self onMetalViewUnavailable];
}

#pragma mark - getter&setter

- (CommonQGVAPCommonInfo *)commonInfo {
    return self.renderer.commonInfo;
}

- (void)setCommonInfo:(CommonQGVAPCommonInfo *)commonInfo {
    [self.renderer setCommonInfo:commonInfo];
}

- (void)setMaskInfo:(CommonQGVAPMaskInfo *)maskInfo {
    [self.renderer setMaskInfo:maskInfo];
}

#pragma mark - main

- (void)display:(CVPixelBufferRef)pixelBuffer mergeInfos:(NSArray<CommonQGVAPMergedInfo *> *)infos {
    
//    if (!self.window) {
//        VAP_Event(kQGVAPModuleCommon, @"quit display pixelbuffer, cuz window is nil!");
//        [self onMetalViewUnavailable];
//        return ;
//    }
//    if (self.drawableSizeShouldUpdate) {
//        CGFloat nativeScale = [UIScreen mainScreen].nativeScale;
//        CGSize drawableSize = CGSizeMake(CGRectGetWidth(self.bounds)*nativeScale, CGRectGetHeight(self.bounds)*nativeScale);
//        self.metalLayer.drawableSize = drawableSize;
//        VAP_Event(kQGVAPModuleCommon, @"update drawablesize :%@", [NSValue valueWithCGSize:drawableSize]);
//        self.drawableSizeShouldUpdate = NO;
//    }
    [self.renderer renderPixelBuffer:pixelBuffer metalLayer:nil mergeInfos:infos];
}

- (void)dispose {
    [self.renderer dispose];
}

#pragma mark - private

- (void)onMetalViewUnavailable{
    
    if ([self.delegate respondsToSelector:@selector(onMetalViewUnavailable)]) {
        [self.delegate onMetalViewUnavailable];
    }
}

@end

#endif
