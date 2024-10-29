//
//  BaseLogStreamHandler.h
//  Pods
//
//  Created by ChenQiang on 2022/7/11.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

@interface PulseLogStreamHandler : NSObject <FlutterStreamHandler>

+ (PulseLogStreamHandler *)share;

- (BOOL)canSend;
- (void)sendObject:(NSString *)type data:(NSString *)data;

@end
