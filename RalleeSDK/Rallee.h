//
//  Rallee.h
//  SimpleSIP
//
//  Created by Techlites Solution Pvt Ltd on 04/04/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct UserAuthenticationData {
    NSString* first_name;
    NSString* last_name;
    NSString* email;
    NSString* SNAccessToken;
    NSString* SNID;
    NSString* SNUsername;
    NSString* app_ver;
    NSString* device_token;
    NSString* SNName;
    NSString* appKey;
    NSString* SNPassword;
    
} UserAuthenticationData;

typedef struct callUserData {
    NSString* caller_user;
    NSString* called_user;
    NSString* sn_type_caller;
    NSString* sn_type_called;
}callUserData;

@interface Rallee : NSObject {
}

@property (nonatomic) UserAuthenticationData userData;
@property (nonatomic) callUserData cid;
@property (nonatomic, strong) NSString *const RRServiceURL;

extern NSString *const RalleeServer;
extern NSString *const RalleeAccountStatus;
extern NSString *const RRURL;
extern NSString *const RalleeRegister;
extern NSString *const RalleeCall;

@end
