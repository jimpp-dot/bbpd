//
// Created by Razvan Lung(long1eu) on 2019-02-15.
// Copyright (c) 2019 The Chromium Authors. All rights reserved.
//

#import "ContactPermissionStrategy.h"


@implementation ContactPermissionStrategy

- (PermissionStatus)checkPermissionStatus:(PermissionGroup)permission {
    return [ContactPermissionStrategy permissionStatus];
}

- (ServiceStatus)checkServiceStatus:(PermissionGroup)permission {
    return ServiceStatusNotApplicable;
}

- (void)requestPermission:(PermissionGroup)permission completionHandler:(PermissionStatusHandler)completionHandler {
    completionHandler(PermissionStatusDenied);

    PermissionStatus status = [self checkPermissionStatus:permission];

    if (status != PermissionStatusDenied) {
        completionHandler(status);
        return;
    }

    if (@available(iOS 9.0, *)) {
        [ContactPermissionStrategy requestPermissionsFromContactStore:completionHandler];
    } else {
        [ContactPermissionStrategy requestPermissionsFromAddressBook:completionHandler];
    }
}

+ (PermissionStatus)permissionStatus {

    if (@available(iOS 9.0, *)) {
        CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];

        switch (status) {
            case CNAuthorizationStatusNotDetermined:
                return PermissionStatusDenied;
            case CNAuthorizationStatusRestricted:
                return PermissionStatusRestricted;
            case CNAuthorizationStatusDenied:
                return PermissionStatusPermanentlyDenied;
            case CNAuthorizationStatusAuthorized:
                return PermissionStatusGranted;
        }

    } else {
        ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();

        switch (status) {
            case kABAuthorizationStatusNotDetermined:
                return PermissionStatusDenied;
            case kABAuthorizationStatusRestricted:
                return PermissionStatusRestricted;
            case kABAuthorizationStatusDenied:
                return PermissionStatusPermanentlyDenied;
            case kABAuthorizationStatusAuthorized:
                return PermissionStatusGranted;
        }
    }


    return PermissionStatusDenied;
}

+ (void)requestPermissionsFromContactStore:(PermissionStatusHandler)completionHandler API_AVAILABLE(ios(9)) {

    CNContactStore *contactStore = [CNContactStore new];

    [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError *__nullable error) {
        if (granted) {
            completionHandler(PermissionStatusGranted);
        } else {
            completionHandler(PermissionStatusDenied);
        }
    }];


    ABAddressBookRequestAccessWithCompletion(ABAddressBookCreate(), ^(bool granted, CFErrorRef error) {
        if (granted) {
            completionHandler(PermissionStatusGranted);
        } else {
            completionHandler(PermissionStatusDenied);
        }
    });

}

+ (void)requestPermissionsFromAddressBook:(PermissionStatusHandler)completionHandler {
    completionHandler(PermissionStatusDenied);

    ABAddressBookRequestAccessWithCompletion(ABAddressBookCreate(), ^(bool granted, CFErrorRef error) {
        if (granted) {
            completionHandler(PermissionStatusGranted);
        } else {
            completionHandler(PermissionStatusPermanentlyDenied);
        }
    });

}
@end
