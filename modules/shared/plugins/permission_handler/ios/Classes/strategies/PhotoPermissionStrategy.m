//
// Created by Razvan Lung(long1eu) on 2019-02-15.
// Copyright (c) 2019 The Chromium Authors. All rights reserved.
//

#import "PhotoPermissionStrategy.h"


@implementation PhotoPermissionStrategy
- (PermissionStatus)checkPermissionStatus:(PermissionGroup)permission {
    return [PhotoPermissionStrategy permissionStatus];
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

    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus authorizationStatus) {
        completionHandler([PhotoPermissionStrategy determinePermissionStatus:authorizationStatus]);
    }];
}

+ (PermissionStatus)permissionStatus {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];

    return [PhotoPermissionStrategy determinePermissionStatus:status];
}

+ (PermissionStatus)determinePermissionStatus:(PHAuthorizationStatus)authorizationStatus {
    switch (authorizationStatus) {
        case PHAuthorizationStatusNotDetermined:
            return PermissionStatusDenied;
        case PHAuthorizationStatusRestricted:
            return PermissionStatusRestricted;
        case PHAuthorizationStatusDenied:
            return PermissionStatusPermanentlyDenied;
        case PHAuthorizationStatusAuthorized:
            return PermissionStatusGranted;
        case PHAuthorizationStatusLimited:
            return PermissionStatusLimited;
    }

    return PermissionStatusDenied;
}

@end