// QGVAPMetalView.h
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
#import "CommonQGVAPConfigModel.h"

@class CommonQGVAPMaskInfo;

@protocol CommonQGVAPMetalViewDelegate <NSObject>

- (void)onMetalViewUnavailable;

@end

@interface CommonQGVAPMetalView : UIView

@property (nonatomic, weak) id<CommonQGVAPMetalViewDelegate> delegate;
@property (nonatomic, strong) CommonQGVAPCommonInfo *commonInfo;
@property (nonatomic, strong) CommonQGVAPMaskInfo *maskInfo;
@property (nonatomic, assign) NSInteger textureId;

- (instancetype)initWithSize:(CGSize)size;
    
- (void)display:(CVPixelBufferRef)pixelBuffer mergeInfos:(NSArray<CommonQGVAPMergedInfo *> *)infos;

- (void)dispose;

@end
