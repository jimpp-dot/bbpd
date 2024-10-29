// QGVAPMetalUtil.h
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

UIKIT_EXTERN NSString *const kCHWDAttachmentVertexFunctionName;
UIKIT_EXTERN NSString *const kCVAPAttachmentVertexFunctionName;
UIKIT_EXTERN NSString *const kCVAPAttachmentFragmentFunctionName;
UIKIT_EXTERN NSString *const kCVAPVertexFunctionName;
UIKIT_EXTERN NSString *const kCVAPYUVFragmentFunctionName;
UIKIT_EXTERN NSString *const kCVAPMaskFragmentFunctionName;
UIKIT_EXTERN NSString *const kCVAPMaskBlurFragmentFunctionName;

extern float const kCVAPMTLVerticesIdentity[16];
extern float kCVAPMTLTextureCoordinatesIdentity[8];
extern float const kCVAPMTLTextureCoordinatesFor90[8];

#ifdef __cplusplus
extern "C" {
#endif
    void commonGenMTLVertices(CGRect rect, CGSize containerSize, float vertices[16], BOOL reverse); //生成顶点坐标
    void commonGenMTLTextureCoordinates(CGRect rect, CGSize containerSize, float coordinates[8], BOOL reverse, NSInteger degree); //生成纹理坐标
    void commonReplaceArrayElements(float arr0[], float arr1[], int size); //arr0[0...(size-1)] <- arr1[0...(size-1)]

    CGSize commonVapSourceSizeForCenterFull(CGSize sourceSize, CGSize renderSize);
    CGRect commonVapRectForCenterFull(CGSize sourceSize, CGSize renderSize);
    CGRect commonVapRectWithContentModeInsideRect(CGRect boundingRect, CGSize aspectRatio, UIViewContentMode contentMode);
#ifdef __cplusplus
}
#endif

@interface CommonQGVAPMetalUtil : NSObject

@end
