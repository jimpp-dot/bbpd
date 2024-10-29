//
//  APFCherryDetectTask.h
//  APBToygerFacade
//
//  Created by richard on 01/02/2018.
//  Copyright © 2018 DTF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BioAuthEngine/AFEStatusBar.h>
#import <APBToygerFacade/APBToygerBaseTask.h>
#import <BioAuthEngine/BioAuthEngine.h>
#import <DTFSensorServices/CameraService.h>
#import <DTFSensorServices/MotionService.h>

@interface APBToygerCherryDetectTask : APBToygerBaseTask <DTFCameraServiceDelegate, DTFMotionServiceDelegate, DTFFaceViewDelegate>

@property(nonatomic, assign)BOOL photinusFlags;

@end
