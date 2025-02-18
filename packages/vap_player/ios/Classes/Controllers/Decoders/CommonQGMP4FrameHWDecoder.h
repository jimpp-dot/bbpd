// QGMP4FrameHWDecoder.h
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

#import "CommonQGBaseDecoder.h"
#import "CommonQGMP4HWDFileInfo.h"
#import <UIKit/UIKit.h>

/* 数字跳动的动画类型*/
typedef NS_ENUM(NSInteger, CommonQGMP4HWDErrorCode){
    
    CommonQGMP4HWDErrorCode_FileNotExist                  = 10000,          // 文件不存在
    CommonQGMP4HWDErrorCode_InvalidMP4File                = 10001,          // 非法的mp4文件
    CommonQGMP4HWDErrorCode_CanNotGetStreamInfo           = 10002,          // 无法获取视频流信息
    CommonQGMP4HWDErrorCode_CanNotGetStream               = 10003,          // 无法获取视频流
    CommonQGMP4HWDErrorCode_ErrorCreateVTBDesc            = 10004,          // 创建desc失败
    CommonQGMP4HWDErrorCode_ErrorCreateVTBSession         = 10005,          // 创建session失败
};

@interface UIDevice (HWD)

- (BOOL)hwd_isSimulator;

@end

@interface CommonQGMP4FrameHWDecoder : CommonQGBaseDecoder


+ (NSString *)errorDescriptionForCode:(CommonQGMP4HWDErrorCode)errorCode;

@end
