//
//  VoiceWrapper.m
//  agora
//
//  Created by bobzhou on 2020/8/31.
//

#import "VoiceWrapper.h"
#import "PulseImVoiceManager.h"

@interface VoiceWrapper()
@property (nonatomic, strong) PulseImVoiceManager *voiceManager;


@end

@implementation VoiceWrapper

- (instancetype)init
{
    self = [super init];
    if (self) {
        _voiceManager = [PulseImVoiceManager new];
    }
    
    return self;
}
- (void)sendDeviceEventWithName:(NSString*)eventName body:(id)body{
    if(_eventSink){
        _eventSink(@{
                     @"type": eventName,
                     @"message": body
                     });
    }
}


-(void)canRecordVoice:(FlutterResult)_result
{
    [_voiceManager canRecordVoice:^(NSError *error, NSDictionary *result) {
        _result([result objectForKey: @"granted"]);
    }];
}

-(void)startRecordVoice:(FlutterResult)_result
{
    __weak typeof(self) self_weak = self;
    _voiceManager.peekBlock = ^(NSTimeInterval seconds){
        [self_weak sendDeviceEventWithName:@"onRecordDurationChanged" body:@(seconds).stringValue];
    };

    [_voiceManager startRecord:^(NSError *error,NSDictionary *result) {
        if (error) {
            _result(@{
                      @"success": @(NO),
                      @"errCode": @(error.code),
                      @"errMsg" : error.localizedDescription
                      });
        }
        else {
            _result(@{
                      @"success": @(YES),
                      @"data" : result
                      });
        }
    }];
    
}

-(void)cancelRecordVoice:(FlutterResult)_result
{
    _voiceManager.peekBlock = nil;
    [_voiceManager cancelRecord];
    
    _result(@(YES));
}

-(void)finishRecordVoice:(FlutterResult)_result
{
    _voiceManager.peekBlock = nil;
    [_voiceManager finishRecord];
    
    _result(@(YES));
}

-(void)startPlayVoice:(NSString *)base64 completion:(FlutterResult)_result
{

    NSData* voiceData = [[NSData alloc] initWithBase64EncodedString:base64 options:0];
    [_voiceManager startPlayVoice:voiceData result:^(NSError *error, NSDictionary *result) {
        if (error) {
            _result(error.localizedDescription);
        }
        else {
            _result(nil);
        }
    }];
}

-(void)stopPlayVoice:(FlutterResult)_result
{
    [_voiceManager stopPlayVoice];
    _result(@(YES));

}


@end


