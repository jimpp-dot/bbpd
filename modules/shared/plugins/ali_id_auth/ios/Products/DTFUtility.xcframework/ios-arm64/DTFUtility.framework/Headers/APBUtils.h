//
//  APBUtils.h
//  BioAuthEngine
//
//  Created by richard on 27/08/2017.
//  Copyright © 2017  DTF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#include <sys/param.h>
#include <sys/mount.h>

#define SCREEN_WIDTH                [[UIScreen mainScreen]bounds].size.width                                    //屏幕宽度
#define SCREEN_HEIGHT               [[UIScreen mainScreen]bounds].size.height                                   //屏幕高度

//获取document目录
#define DOCUMENT_PATH               [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

//资源文件目录
#define ASSET_PATH                  [DOCUMENT_PATH stringByAppendingPathComponent:@"BioAuth"]

//返回不为nil的string
#define NONE_NIL_STRING(str)        (str ? str : @"")


#define SafeRelease(obj) if(obj){obj=nil;}

//主线程同步操作
#define SYNC_MAINTHREAD_BEGIN           [APBUtils APBMainThread:^{
#define SYNC_MAINTHREAD_END             }];

//pipeInfo线程安全操作
static NSString *const kAPBPipeInfoMutexToken = @"";
static id __apb_thread_safe_object_for_key(NSMutableDictionary *pipeInfo, NSString *key){
    id ret;
    @synchronized(kAPBPipeInfoMutexToken){
        if ([pipeInfo isKindOfClass:[NSMutableDictionary class]] && [pipeInfo objectForKey: key]) {
            ret = [pipeInfo objectForKey:key];
        }
    }
    return ret;
}

//从pipeInfo中获取Object，线程安全
#define THREAD_SAFE_OBJECT_FOR_KEY(pipeInfo, key)   __apb_thread_safe_object_for_key(pipeInfo, key)

//向pipeInfo中添加或修改Object,线程安全
#define THREAD_SAFE_SET_OBJECT_FOR_KEY(pipeInfo, key, value)                                            \
    @synchronized(kAPBPipeInfoMutexToken){                                                                 \
        if ([pipeInfo isKindOfClass:[NSMutableDictionary class]] && key && value) {                     \
            [pipeInfo setObject:value forKey:key];}}

//删除PipeInfo中某个Object，线程安全
#define THREAD_SAFE_REMOVE_OBJECT_FOR_KEY(pipeInfo, key)                                                \
    @synchronized(kAPBPipeInfoMutexToken){                                                                 \
        if ([pipeInfo isKindOfClass:[NSMutableDictionary class]] && [pipeInfo objectForKey: key]) {     \
            [pipeInfo removeObjectForKey: key];}}

//将dict中对应value增加1
#define INCREASE_BY_ONE(pipeInfo, key){                                                                 \
    NSInteger num = [[pipeInfo objectForKey:key]integerValue]+1;                                        \
THREAD_SAFE_SET_OBJECT_FOR_KEY(pipeInfo, key, [NSNumber numberWithInteger:num]);}

//将dict中对应value减1
#define DECREASE_BY_ONE(pipeInfo, key){                                                                 \
    NSInteger num = [[pipeInfo objectForKey:key]integerValue]-1;                                        \
THREAD_SAFE_SET_OBJECT_FOR_KEY(pipeInfo, key, [NSNumber numberWithInteger:--num]);}

#define LOCK(locker, ...) dispatch_semaphore_wait(locker, DISPATCH_TIME_FOREVER); \
__VA_ARGS__; \
dispatch_semaphore_signal(locker);

@interface APBUtils : NSObject

+ (NSString *)MD5WithData:(NSData *)data;

+ (NSString *)randomString:(NSInteger)len;

+ (BOOL)isWifi;

/**
 *  主线程同步操作，请调用宏版本
 */
+ (void)APBMainThread:(dispatch_block_t)block;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (NSString*)convertToJSONString:(NSDictionary *)infoDict;

+ (NSString *)currentLanguage;

+ (NSString *)localizedStringForKey:(NSString *)key inBundle:(NSString *)bundle;

+ (NSString *)localizedStringForKey:(NSString *)key;

+ (long long)getTotalDiskSize;

+ (long long)getAvailableDiskSize;

+ (NSString*)deviceVersion;

+ (NSString *)osVersion;

+ (NSString *)appName;

+ (NSString *)appVersion;

+ (CMVideoDimensions)maxResolution:(AVCaptureDevicePosition) position;

@end
