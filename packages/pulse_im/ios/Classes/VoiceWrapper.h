//
//  VoiceWrapper.h
//  agora
//
//  Created by bobzhou on 2020/8/31.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>


NS_ASSUME_NONNULL_BEGIN

@interface VoiceWrapper : NSObject
@property(nonatomic, strong) FlutterEventSink eventSink;

-(void)startPlayVoice:(NSString *)base64 completion:(FlutterResult)result;
-(void)stopPlayVoice:(FlutterResult)result;
-(void)startRecordVoice:(FlutterResult)result;
-(void)canRecordVoice:(FlutterResult)result;
-(void)cancelRecordVoice:(FlutterResult)result;
-(void)finishRecordVoice:(FlutterResult)result;


@end

NS_ASSUME_NONNULL_END
