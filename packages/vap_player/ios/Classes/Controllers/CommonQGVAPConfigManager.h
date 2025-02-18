// QGVAPConfigManager.h
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

#import <Foundation/Foundation.h>
#import "CommonQGMP4HWDFileInfo.h"
#import "CommonQGVAPConfigModel.h"
#import "CommonVAPMacros.h"

@class CommonQGVAPSourceInfo;
@protocol CommonQGVAPConfigDelegate <NSObject>

- (void)onVAPConfigResourcesLoaded:(CommonQGVAPConfigModel *)config error:(NSError *)error;

@optional
- (NSString *)vap_contentForTag:(NSString *)tag resource:(CommonQGVAPSourceInfo *)info;        //替换配置中的资源占位符（不处理直接返回tag）
- (void)vap_loadImageWithURL:(NSString *)urlStr context:(NSDictionary *)context completion:(VAPImageCompletionBlock)completionBlock;

@end

@interface CommonQGVAPConfigManager : NSObject

@property (nonatomic, weak) id<CommonQGVAPConfigDelegate> delegate;
@property (nonatomic, assign) BOOL hasValidConfig;
@property (nonatomic, strong) CommonQGVAPConfigModel *model;

- (instancetype)initWith:(CommonQGMP4HWDFileInfo *)fileInfo;
- (void)loadConfigResources;
- (void)loadMTLTextures:(id<MTLDevice>)device;
- (void)loadMTLBuffers:(id<MTLDevice>)device;

@end

