//
// Created by Razvan Lung(long1eu) on 2019-02-15.
// Copyright (c) 2019 The Chromium Authors. All rights reserved.
//

#import "AudioVideoPermissionStrategy.h"


@implementation AudioVideoPermissionStrategy

- (PermissionStatus)checkPermissionStatus:(PermissionGroup)permission {
    if (permission == PermissionGroupCamera) {
        return [AudioVideoPermissionStrategy permissionStatus:AVMediaTypeVideo];
    } else if (permission == PermissionGroupMicrophone) {
        return [AudioVideoPermissionStrategy permissionStatus:AVMediaTypeAudio];
    }
    return PermissionStatusDenied;
}

- (ServiceStatus)checkServiceStatus:(PermissionGroup)permission {
    return ServiceStatusNotApplicable;
}

- (void)requestPermission:(PermissionGroup)permission completionHandler:(PermissionStatusHandler)completionHandler {
    PermissionStatus status = [self checkPermissionStatus:permission];

    if (status != PermissionStatusDenied) {
        completionHandler(status);
        return;
    }

    AVMediaType mediaType;

    if (permission == PermissionGroupCamera) {
        mediaType = AVMediaTypeVideo;
    } else if (permission == PermissionGroupMicrophone) {
        mediaType = AVMediaTypeAudio;
    } else {
        completionHandler(PermissionStatusDenied);
        return;
    }

    [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
        if (granted) {
            completionHandler(PermissionStatusGranted);
        } else {
            completionHandler(PermissionStatusPermanentlyDenied);
        }
    }];
}

+ (PermissionStatus)permissionStatus:(AVMediaType const)mediaType {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:mediaType];

    switch (status) {
        case AVAuthorizationStatusNotDetermined:
            return PermissionStatusDenied;
        case AVAuthorizationStatusRestricted:
            return PermissionStatusRestricted;
        case AVAuthorizationStatusDenied:
            return PermissionStatusPermanentlyDenied;
        case AVAuthorizationStatusAuthorized:
            return PermissionStatusGranted;
    }

    return PermissionStatusDenied;
}

@end