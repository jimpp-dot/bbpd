//
//  FlutterVapViewFactory.m
//  agora
//
//  Created by liqf on 2020/9/9.
//

#import <Foundation/Foundation.h>
#import <FlutterVapViewFactory.h>
#import <UIView+VAP.h>
#import <FlutterVapView.h>

@implementation FlutterVapViewFactory {
  NSObject<FlutterBinaryMessenger>* _messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
  self = [super init];
  if (self) {
    _messenger = messenger;
  }
  return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
  return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args {
    FlutterVapView *vapView = [[FlutterVapView alloc] initWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];

    return vapView;
}
@end

