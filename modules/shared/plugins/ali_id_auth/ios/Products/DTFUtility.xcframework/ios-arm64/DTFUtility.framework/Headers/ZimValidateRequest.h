//
//  ZimValidateRequest.h
//  DTFIdentityManager
//
//  Created by richard on 27/08/2017.
//  Copyright © 2017  DTF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZimValidateRequest;

#ifndef SUPPORT_PB
@interface ZimValidateRequest:NSObject
@property (nonatomic,strong) NSString* zimId ;
@property (nonatomic,copy) NSString* zimData ;
@property(nonatomic, strong) NSDictionary* bizData;
@property (nonatomic,strong)NSString *idString;
@property (nonatomic,strong)NSString *nameString; 
@property (nonatomic,strong)NSString *externParam;
@property(nonatomic, strong) NSDictionary* wishDict;
@property(nonatomic, strong) NSArray* wishVideoUrl;
@property(nonatomic, strong) NSArray* wishAudioUrl;

+ (Class)bizDataElementClass;
@end

#else

#import <APProtocolBuffers/ProtocolBuffers.h>

@interface ZimValidateRequest : APDPBGeneratedMessage

@property (readonly) BOOL hasZimId;
@property (readonly) BOOL hasZimData;
@property (readonly) BOOL hasBizData;

@property (nonatomic,strong) NSString* zimId ;
@property (nonatomic,strong) NSData* zimData ;
@property (nonatomic,strong) PBMapStringString* bizData;

@end
#endif
