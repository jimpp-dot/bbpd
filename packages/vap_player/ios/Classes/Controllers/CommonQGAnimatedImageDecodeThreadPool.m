// QGAnimatedImageDecodeThreadPool.m
// Tencent is pleased to support the open source community by making vap available.
//
// Copyright (C) 2020 THL A29 Limited, a Tencent company.  All rights reserved.
//
// Licensed under the MIT License (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
//
// http://opensource.org/licenses/MIT
//
// Unless required by applicable law or agreed to in writing, software distributed under the License is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions and
// limitations under the License.

#import "CommonQGAnimatedImageDecodeThreadPool.h"
#import "CommonQGAnimatedImageDecodeThread.h"
#import "CommonQGVAPSafeMutableArray.h"

@interface CommonQGAnimatedImageDecodeThreadPool (){

    NSMutableArray *_threads;
}

@end

@implementation CommonQGAnimatedImageDecodeThreadPool

+ (instancetype)sharedPool {

    static CommonQGAnimatedImageDecodeThreadPool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CommonQGAnimatedImageDecodeThreadPool alloc] init];
    });
    return instance;
}

- (instancetype)init {

    if (self = [super init]) {
        _threads = [CommonQGVAPSafeMutableArray new];
    }
    return self;
}

/**
 从池子中找出没被占用的线程，如果没有则新建一个
 
 @return 解码线程
 */
- (CommonQGAnimatedImageDecodeThread *)getDecodeThread {

    CommonQGAnimatedImageDecodeThread *freeThread = nil;
    for (CommonQGAnimatedImageDecodeThread *thread in _threads) {
        if (!thread.occupied) {
            freeThread = thread;
        }
    }
    if (!freeThread) {
        freeThread = [[CommonQGAnimatedImageDecodeThread alloc] initWithTarget:self selector:@selector(run) object:nil];
        [freeThread start];
        [_threads addObject:freeThread];
    }
    return freeThread;
}

- (void)run{
    //线程保活
    @autoreleasepool {
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop run];
    }
}

@end
