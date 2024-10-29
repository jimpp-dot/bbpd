//
//  NSObject+FlutterVapViewFactory.m
//  agora
//
//  Created by liqf on 2020/9/9.
//
#import <Flutter/Flutter.h>

@interface FlutterVapViewFactory : NSObject <FlutterPlatformViewFactory>
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end
