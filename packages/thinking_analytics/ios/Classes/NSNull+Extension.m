//
//  NSNull+Extension.m
//  tracker
//
//  Created by 姚天成 on 2023/6/27.
//

#import "NSNull+Extension.h"

@implementation NSNull (Extension)

- (bool)isEqualToString:(id)obj {
    if ([obj isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}

@end
