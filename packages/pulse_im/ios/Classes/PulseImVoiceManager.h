//
//  RCTRongCloudVoiceManager.h
//  RCTRongCloud
//
//  Created by LvBingru on 4/18/16.
//  Copyright © 2016 erica. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RCVoiceResultBlock)(NSError *error, NSDictionary *result);

@interface PulseImVoiceManager : NSObject

/*
 * 录音时长回调，没隔0.5s更新
 */
@property(nonatomic, copy) void (^peekBlock)(NSTimeInterval);

- (void)canRecordVoice:(RCVoiceResultBlock)result;
- (void)startRecord:(RCVoiceResultBlock)result;
- (void)cancelRecord;
- (void)finishRecord;
- (void)startPlayVoice:(NSData *)voiceData result:(RCVoiceResultBlock)result;
- (void)stopPlayVoice;

@end
