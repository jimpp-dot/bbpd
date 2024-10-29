//
//  BaseEffectCoreEventHandler.h
//  base_effect_core
//
//  Created by eagle on 2022/2/22.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <RtcAudioEffectCore/RtcAudioEffectKit.h>

@interface BaseEffectCoreEventHandler : NSObject<RtcAudioEffectDelegate>

@property (nonatomic, strong) FlutterEventSink eventSink;

@end
