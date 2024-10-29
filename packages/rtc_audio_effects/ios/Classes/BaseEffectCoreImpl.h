//
//  BaseEffectCoreImpl.h
//  base_effect_core
//
//  Created by eagle on 2022/2/22.
//

#import <Foundation/Foundation.h>
#import "BaseEffectInterface.h"
#import "BaseEffectCoreEventHandler.h"
#import <RtcAudioEffectCore/RtcAudioEffectKit.h>

@interface BaseEffectCoreImpl : NSObject <BaseEffectInterface>

@property (nonatomic, strong) RtcAudioEffectKit *bbEffectCore;

- (BaseEffectCoreEventHandler *)getEventHandler;

@end
