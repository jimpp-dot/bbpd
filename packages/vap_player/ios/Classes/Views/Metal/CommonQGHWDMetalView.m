// QGHWDMetalView.m
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

#import "CommonQGHWDMetalView.h"
#import "CommonQGVAPLogger.h"
#import "CommonQGHWDMetalRenderer.h"

#if TARGET_OS_SIMULATOR//模拟器

@implementation CommonQGHWDMetalView

- (void)display:(CVPixelBufferRef)pixelBuffer {}

-(void)dispose {}

@end

#else

@interface CommonQGHWDMetalView ()

@end

@implementation CommonQGHWDMetalView

#pragma mark - override

- (void)setTextureId:(NSInteger)textureId {
    _textureId = textureId;
}

- (void)dealloc {
    [self onMetalViewUnavailable];
}

#pragma mark - main
- (void)display:(CVPixelBufferRef)pixelBuffer {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pixelBuffer" object:
     @{@"pixelBuffer": (__bridge id _Nullable)pixelBuffer,
       @"textureId": @(self.textureId)}];
}

/**
 资源回收
 */
- (void)dispose {
    [self removeFromSuperview];
//    [self.renderer dispose];
}

#pragma mark - private

- (void)onMetalViewUnavailable{
    
    if ([self.delegate respondsToSelector:@selector(onMetalViewUnavailable)]) {
        [self.delegate onMetalViewUnavailable];
    }
}

@end

#endif
