//
//  DTFMotionService.h
//  EVDeviceSensor
//
//  Created by yukun.tyk on 30/12/2016.
//  Copyright © 2016  DTF. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct dtf_vec3_t {
    float x;
    float y;
    float z;
}dtf_vec3;

typedef struct dtf_vec4_t {
    float w;
    float x;
    float y;
    float z;
}dtf_vec4;

typedef struct dtf_motion_data_t{
    dtf_vec4 attitude;
    dtf_vec3 acceleration;
    dtf_vec3 rotation;
    dtf_vec3 gravity;
    dtf_vec3 magnetic;
}dtf_motion_data;

@protocol DTFMotionServiceDelegate <NSObject>

- (void)motionDataDidUpdate:(dtf_motion_data) motionData;

@end

@interface DTFMotionService : NSObject

@property(nonatomic, assign, readonly)dtf_motion_data motionData;

- (void)setDelegate:(id<DTFMotionServiceDelegate>)delegate;

- (void)startUpdateWithInterval:(NSTimeInterval)interval;

- (void)stop;

@end
