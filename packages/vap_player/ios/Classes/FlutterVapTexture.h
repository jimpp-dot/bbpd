// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import <Flutter/Flutter.h>
#import "VAPTexturePiayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlutterVapTexture : NSObject <FlutterTexture, CommonHWDMP4PlayDelegate>

@property (nonatomic, assign) NSInteger textureId;

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar;

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result;

- (void)dispose;

@end

NS_ASSUME_NONNULL_END
