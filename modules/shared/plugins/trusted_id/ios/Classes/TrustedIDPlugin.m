#import "TrustedIDPlugin.h"
#import <du/DUEntry.h>

@implementation TrustedIDPlugin{
    DUEntry *entry;
    NSString *strCDID;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [[FlutterMethodChannel alloc]
      initWithName:@"ly.plugins.trusted_id"
            binaryMessenger:[registrar messenger]
			codec:[FlutterStandardMethodCodec sharedInstance]
			taskQueue:[[registrar messenger] makeBackgroundTaskQueue]];
  TrustedIDPlugin* instance = [[TrustedIDPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)init {
  self = [super init];
  if (self) {
    @try {
        entry = [[DUEntry alloc] init];
        NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
        NSString *customerId = dict[@"DigitalUnionCustomerId"];
        NSLog(@"Digitalunion: customerId== %@",customerId);
        [entry setCustomerId:customerId];
    } @catch(NSException *exception) {
        NSLog(@"Digitalunion: crash %@", exception);
    }
  }
  return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getQueryID" isEqualToString:call.method]) {
      if(strCDID){
          result(strCDID);
      }else if(entry){
         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            @try {
                [self->entry run];
                self->strCDID = [self->entry getDUSecVerification];
                NSLog(@"Digitalunion: getQueryID - %@", self->strCDID);
                dispatch_async(dispatch_get_main_queue(), ^{
                    result(self->strCDID == nil ? @"" : self->strCDID);
                });
            } @catch(NSException *exception) {
                result(@"");
            }
         });
          
      }else{
          result(nil);
      }
  }else if([@"getOpenAnmsID" isEqualToString:call.method]){
      result(@(YES));
  }else if([@"setConfig" isEqualToString:call.method]){
      result(@(YES));
  }else if([@"setData" isEqualToString:call.method]){
      result(@(YES));
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
