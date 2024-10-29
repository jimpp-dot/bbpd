//
//  DTFFaceView.h
//  MultiFactorFacade
//
//  Created by mengbingchuan on 2022/6/22.
//  Copyright © 2022   DTF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTFFaceViewProtocol.h"

typedef NS_ENUM(NSInteger, DTFAuthScene) {
    DTFAuthSceneFace =        1,  //刷脸
    DTFAuthSceneMultiFactor = 2,  //意愿
};

@interface DTFFaceView : UIView<DTFFaceViewProtocol>

- (instancetype)initWithAuthScene:(DTFAuthScene)authScene;

@end
