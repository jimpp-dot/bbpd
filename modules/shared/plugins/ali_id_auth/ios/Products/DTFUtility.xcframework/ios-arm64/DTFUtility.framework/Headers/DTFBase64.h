//
//  DTFBase64.h
//  DTFUtility
//
//  Created by richard on 2018/8/13.
//  Copyright © 2018 com. .iphoneclient.DTF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTFBase64 : NSObject

+(NSString *)encodeData:(NSData *)data;

+(NSData *)decodeString:(NSString *)str;

+(NSString *)stringByWebSafeEncodingData:(NSData *)data padded:(BOOL)pad;

@end
