//
//  BaseEffectCoreEventHandler.m
//  base_effect_core
//
//  Created by eagle on 2022/2/22.
//

#import "BaseEffectCoreEventHandler.h"

@implementation BaseEffectCoreEventHandler

- (BOOL)guardSink{
    if (self.eventSink == nil) {
        return true;
    }
    return false;
}

- (void)audioRouteChanged:(int)routing {
    if ([self guardSink]) {
        return;
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"onAudioRouteChanged" forKey:@"method"];
    [dic setObject:[NSNumber numberWithInt:routing] forKey:@"routing"];

    dispatch_async(dispatch_get_main_queue(), ^{
        self.eventSink(dic);
    });
}

- (void)stateChanged:(int)state {
    if ([self guardSink]) {
        return;
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"onStateChanged" forKey:@"method"];
    [dic setObject:[NSNumber numberWithInt:state] forKey:@"state"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.eventSink(dic);
    });
}

- (void)sliceScoreUpdate:(int)beginPosMs endPosMs:(int)endPosMs pitch:(float)pitch score:(float)score {
    if ([self guardSink]) {
        return;
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"onKMarkSliceScoreUpdate" forKey:@"method"];
    [dic setObject:[NSNumber numberWithInt:beginPosMs] forKey:@"beginPosMs"];
    [dic setObject:[NSNumber numberWithInt:endPosMs] forKey:@"endPosMs"];
    [dic setObject:[NSNumber numberWithFloat:pitch] forKey:@"pitch"];
    [dic setObject:[NSNumber numberWithFloat:score] forKey:@"score"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.eventSink(dic);
    });
}

- (void)sentenceScoreUpdate:(int)index currentScore:(float)currentScore totalScore:(float)totalScore {
    if ([self guardSink]) {
        return;
    }
        
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"onKMarkSentenceScoreUpdate" forKey:@"method"];
    [dic setObject:[NSNumber numberWithInt:index] forKey:@"index"];
    [dic setObject:[NSNumber numberWithFloat:currentScore] forKey:@"currentScore"];
    [dic setObject:[NSNumber numberWithFloat:totalScore] forKey:@"totalScore"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.eventSink(dic);
    });
}

- (void)recordAudioFrame:(int)sampleRate channels:(int)channels samples:(int)samples data:(int16_t * _Nullable)data {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"onRecordAudioFrame" forKey:@"method"];
    [dic setObject:[NSNumber numberWithInt:sampleRate] forKey:@"sampleRate"];
    [dic setObject:[NSNumber numberWithInt:channels] forKey:@"channels"];
    [dic setObject:[NSNumber numberWithInt:samples] forKey:@"samples"];

    NSData *ocData = [NSData dataWithBytes:data length:sizeof(int16_t)];
    FlutterStandardTypedData *resData = [FlutterStandardTypedData typedDataWithBytes:ocData];
    [dic setObject:resData forKey:@"data"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.eventSink(dic);
    });
}

- (void)productProgress:(float)progress {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"onProductProgress" forKey:@"method"];
    [dic setObject:[NSNumber numberWithFloat:progress] forKey:@"progress"];

    dispatch_async(dispatch_get_main_queue(), ^{
        self.eventSink(dic);
    });
}

- (void)audioVolumeIndication:(int)volume time:(int64_t)time{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"onAudioVolumeIndication" forKey:@"method"];
    [dic setObject:[NSNumber numberWithInt:volume] forKey:@"volume"];
    [dic setObject:[NSNumber numberWithInt:time] forKey:@"timeMs"];

    dispatch_async(dispatch_get_main_queue(), ^{
        self.eventSink(dic);
    });
}

@end
