// QGMP4Parser.h
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
#import "CommonQGMP4Box.h"

@class CommonQGMP4Parser;
@protocol CommonQGMP4ParserDelegate <NSObject>

@optional
- (void)didParseMP4Box:(CommonQGMP4Box *)box parser:(CommonQGMP4Parser *)parser;
- (void)MP4FileDidFinishParse:(CommonQGMP4Parser *)parser;

@end

@interface CommonQGMP4Parser : NSObject

@property (nonatomic, strong) CommonQGMP4Box *rootBox;
@property (nonatomic, strong) NSFileHandle *fileHandle;
@property (nonatomic, weak) id<CommonQGMP4ParserDelegate> delegate;

- (instancetype)initWithFilePath:(NSString *)filePath;
- (void)parse;
- (NSData *)readDataForBox:(CommonQGMP4Box *)box;
- (NSInteger)readValue:(const char*)bytes length:(NSInteger)length;

@end

@interface CommonQGMP4ParserProxy : NSObject

- (instancetype)initWithFilePath:(NSString *)filePath;

@property (nonatomic, assign) NSInteger picWidth;       //视频宽度
@property (nonatomic, assign) NSInteger picHeight;      //视频高度
@property (nonatomic, assign) NSInteger fps;            //视频fps
@property (nonatomic, assign) double duration;          //视频时长
@property (nonatomic, strong) NSData *spsData;          //sps
@property (nonatomic, strong) NSData *ppsData;          //pps
@property (nonatomic, strong) NSArray *videoSamples;    //所有帧数据，包含了位置和大小等信息
@property (nonatomic, strong) NSArray *videoSyncSampleIndexes;  // 所有关键帧的index
@property (nonatomic, strong) CommonQGMP4Box *rootBox;        //mp4文件根box
@property (nonatomic, strong) CommonQGMP4TrackBox *videoTrackBox;     //视频track
@property (nonatomic, strong) CommonQGMP4TrackBox *audioTrackBox;     //音频track
/** vps */
@property (nonatomic, strong) NSData *vpsData;
/** 视频流编码器ID类型 */
@property (nonatomic, assign) CommonQGMP4VideoStreamCodecID videoCodecID;

- (void)parse;
- (NSData *)readPacketOfSample:(NSInteger)sampleIndex;
- (NSData *)readDataOfBox:(CommonQGMP4Box *)box length:(NSInteger)length offset:(NSInteger)offset;

@end
