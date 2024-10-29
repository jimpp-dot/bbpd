// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import <Flutter/Flutter.h>
#import <UIView+VAP.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterVapView : NSObject <FlutterPlatformView, HWDMP4PlayDelegate>

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
              binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

//- (UIView*)view;
@end

NS_ASSUME_NONNULL_END
