//
//  RalleeJSON.h
//  SimpleSIP
//
//  Created by Techlites Solution Pvt Ltd on 05/04/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rallee.h"

@interface RalleeJSON : NSObject

- (NSDictionary *)convertToDictionary:(UserAuthenticationData)userData;

- (NSString *)convertToJSON:(NSDictionary *)dict;

- (NSString *)convertToJSONString:(UserAuthenticationData)userData;

- (NSString *)convertToJSONStringWithCallUser:(callUserData)userData;

+ (id)parseJsonResponse:(NSData *)data error:(NSError **)error;

@end
