////
////  CaidHelper.m
////  shared_app_plugin
////
////  Created by 梁杰 on 2021/3/18.
////
//
//#import "CaidHelper.h"
//#include <sys/sysctl.h>
//#import "NSString+JKHash.h"
//#import <CoreTelephony/CTTelephonyNetworkInfo.h>
//#import <CoreTelephony/CTCarrier.h>
//
//static const char *SIDFAMachine ="hw.machine";
//static const char *SIDFAModel = "hw.model" ;
//
//static time_t bootSecTime(){
//    struct timeval boottime;
//    size_t len = sizeof (boottime);
//    int mib[2] = {CTL_KERN,KERN_BOOTTIME};
//    if(sysctl(mib,2,&boottime,&len,NULL,0)<0){
//        return 0;
//    }
//    return boottime.tv_sec;
//}
//
//static NSString *getSystemHardwareByName(const char *typeSpecifier){ size_t size;
//    sysctlbyname (typeSpecifier,NULL,&size,NULL,0);
//    char *answer = malloc (size);
//    sysctlbyname(typeSpecifier,answer,&size,NULL,0);
//    NSString*results = [NSString stringWithUTF8String:answer];
//    free (answer);
//    return results;
//}
//
//@implementation CaidHelper
////设备启动时间
//+(NSString *)bootTimeInSec{
//    return [NSString stringWithFormat:@"%ld",bootSecTime()];
//}
//
////国家
//+ (NSString *)countryCode{
//    NSLocale *locale = [NSLocale currentLocale];
//    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode];
//    return countryCode;
//}
//
////语言
//+(NSString *)language {
//    NSString *language;
//    NSLocale *locale =[NSLocale currentLocale];
//    if([[NSLocale preferredLanguages] count]> 0){
//        language =[[NSLocale preferredLanguages] objectAtIndex:0];
//    } else {
//        language = [locale objectForKey:NSLocaleLanguageCode];
//    }
//    return language;
//}
//
////设备名称
//+ (NSString *) deviceName{
//    NSString *str = [[UIDevice currentDevice] name];
//    if (str.length == 0)
//    {
//        return nil;
//    }
//    return [str jk_md5String];
//}
//
////系统版本
//+ (NSString *)systemVersion{
//    return [[UIDevice currentDevice] systemVersion];
//}
//
////设备 Machine
//+ (NSString *) machine{
//    NSString *machine = getSystemHardwareByName(SIDFAMachine);
//    return machine == nil ? @"" : machine;
//}
//
////运营商
//+ (NSString* )carrierInfo {
//    #if TARGET_IPHONE_SIMULATOR
//    return @"SIMULATOR";
//    #else
//    static dispatch_queue_t _queue;
//    static dispatch_once_t once;
//    dispatch_once(&once,^{
//        _queue = dispatch_queue_create([[NSString stringWithFormat:@"com.carr.%@"
//        , self] UTF8String], NULL);
//    });
//    __block NSString * carr = nil;
//    dispatch_semaphore_t semaphore =dispatch_semaphore_create(0);
//    dispatch_async(_queue, ^(){
//        CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
//        CTCarrier *carrier = nil;
//        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 12.1){
//            if ([info respondsToSelector:@selector(serviceSubscriberCellularProviders)]) {
//            #pragma clang diagnostic push
//            #pragma clang diagnostic ignored "-Wunguarded-availability-new"
//            NSArray *carrierKeysArray = [info.serviceSubscriberCellularProviders.allKeys sortedArrayUsingSelector:@selector(compare:)];
//                carrier = info.serviceSubscriberCellularProviders
//                [carrierKeysArray.firstObject];
//                if (!carrier.mobileNetworkCode) {
//                    carrier = info.serviceSubscriberCellularProviders
//                    [carrierKeysArray.lastObject];
//                }
//            #pragma clang diagnostic pop
//            }
//        }
//        if(!carrier){
//        #pragma clang diagnostic push
//        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
//            carrier = info.subscriberCellularProvider;
//        #pragma clang diagnostic pop
//        }
//        if (carrier != nil) {
//            NSString *networkCode = [carrier mobileNetworkCode];
//            NSString *countryCode = [carrier mobileCountryCode];
//            if (countryCode && [countryCode isEqualToString:@"460"] && networkCode) {
//                if ([networkCode isEqualToString:@"00"]||
//                    [networkCode isEqualToString:@"02"] ||
//                    [networkCode isEqualToString:@"07"] ||
//                    [networkCode isEqualToString:@"08"]) {
//                    carr= @"中国移动";
//                }
//                if ([networkCode isEqualToString:@"01"]
//                    || [networkCode isEqualToString:@"06"]
//                    || [networkCode isEqualToString:@"09"]){
//                    carr= @"中国联通";
//                }
//                if ([networkCode isEqualToString:@"03"] ||
//                    [networkCode isEqualToString:@"05"] ||
//                    [networkCode isEqualToString:@"11"]){
//                    carr= @"中国电信";
//                }
//                if ([networkCode isEqualToString:@"04"]){
//                    carr= @"中国卫通";
//                }
//                if([networkCode isEqualToString:@"20"]){
//                    carr= @"中国铁通";
//                }
//            }else {
//                carr = [carrier.carrierName copy] ;
//
//            }
//        }
//        if (carr.length <= 0){
//            carr = @"unknown";
//        }
//        dispatch_semaphore_signal (semaphore);
//   });
//   dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW,0.5*NSEC_PER_SEC);
//   dispatch_semaphore_wait (semaphore,t) ;
//   return [carr copy] ;
//#endif
//    return @"";
//}
//
////物理内存容量
//+ (NSString *) memory{
//    return [NSString stringWithFormat:@"%lld",[NSProcessInfo processInfo].physicalMemory];
//}
//
//// 硬盘容量
//+ (NSString *)disk{
//    int64_t space = -1;
//    NSError *error = nil;
//    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
//    if (!error){
//        space =[[attrs objectForKey:NSFileSystemSize] longLongValue];
//        
//    }
//    if (space < 0)
//    {
//        space = -1;
//        
//    }
//return [NSString stringWithFormat:@"%lld",space];
//}
//
////统更新时间
//+(NSString *)sysFileTime{
//    NSString *result = nil;
//    NSString *information = @"L3Zhci9tb2JpbGUvTGlicmFyeS9Vc2VyQ29uZmlndXJhdGlvblByb2ZpbGVzL1B1YmxpY0luZm8vTUNNZXRhLnBsaXN0";
//    NSData *data=[[NSData alloc]initWithBase64EncodedString:information options:0];
//    NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    NSError *error = nil;
//    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:dataString error:&error];
//    if (fileAttributes) {
//        id singleAttibute = [fileAttributes objectForKey:NSFileCreationDate];
//        if ([singleAttibute isKindOfClass:[NSDate class]]) {
//            NSDate *dataDate = singleAttibute;
//            result = [NSString stringWithFormat:@"%f",[dataDate timeIntervalSince1970]];
//        }
//    }
//    return result;
//}
//
//// 设备 Model
//+ (NSString *) model{
//    NSString *model=getSystemHardwareByName(SIDFAModel);
//    return model == nil? @"" :model;
//}
//
////时区
//+ (NSString *) timeZone{
//    NSInteger offset = [NSTimeZone systemTimeZone].secondsFromGMT;
//    return [NSString stringWithFormat:@"%ld",(long)offset];
//}
//
//+ (NSDictionary *)deviceInfo{
//    NSDictionary *dic = @{
//        @"bootTimeInSec":[self bootTimeInSec]?:@"",
//        @"countryCode":[self countryCode]?:@"",
//        @"language":[self language]?:@"",
//        @"deviceName":[self deviceName]?:@"",
//        @"systemVersion":[self systemVersion]?:@"",
//        @"machine":[self machine]?:@"",
//        @"carrierInfo":[self carrierInfo]?:@"",
//        @"memory":[self memory]?:@"",
//        @"disk":[self disk]?:@"",
//        @"sysFileTime":[self sysFileTime]?:@"",
//        @"model":[self model]?:@"",
//        @"timeZone":[self timeZone]?:@"",
//    };
//    return  dic;
//}
//
//@end
