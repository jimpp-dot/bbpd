//
//  sbox.h
//  sbox
//
//  Created by liqf on 2019/11/28.
//  Copyright © 2019. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "str_utils.h"
#import "sha256.h"
#import "aes_small.h"

@interface SBox : NSObject

- (NSString*)hFunc:(NSString*)text;
- (NSString*)decrypt:(NSString*)text;

@end
