// QGHWDMetalRenderer.h
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

#import <UIKit/UIKit.h>
#import <Metal/Metal.h>
#import "CommonVAPMacros.h"

UIKIT_EXTERN NSString *const kCHWDVertexFunctionName;
UIKIT_EXTERN NSString *const kCHWDYUVFragmentFunctionName;
extern matrix_float3x3 const kCColorConversionMatrix601Default;
extern matrix_float3x3 const kCColorConversionMatrix601FullRangeDefault;
extern matrix_float3x3 const kCColorConversionMatrix709Default;
extern matrix_float3x3 const kCColorConversionMatrix709FullRangeDefault;
extern matrix_float3x3 const kCBlurWeightMatrixDefault;
extern id<MTLDevice> kCQGHWDMetalRendererDevice;

#if TARGET_OS_SIMULATOR//模拟器

@interface CommonQGHWDMetalRenderer : NSObject

@property (nonatomic, assign) CommonQGHWDTextureBlendMode blendMode;

- (instancetype)initWithMetalLayer:(id)layer blendMode:(CommonQGHWDTextureBlendMode)mode;
- (void)renderPixelBuffer:(CVPixelBufferRef)pixelBuffer metalLayer:(id)layer;
- (void)dispose;

@end
#else

@interface CommonQGHWDMetalRenderer : NSObject

@property (nonatomic, assign) CommonQGHWDTextureBlendMode blendMode;

- (instancetype)initWithMetalLayer:(CAMetalLayer *)layer blendMode:(CommonQGHWDTextureBlendMode)mode;

- (void)renderPixelBuffer:(CVPixelBufferRef)pixelBuffer metalLayer:(CAMetalLayer *)layer;

- (void)dispose;

@end

#endif
