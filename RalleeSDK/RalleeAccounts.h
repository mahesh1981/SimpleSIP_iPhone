//
//  RalleeAccounts.h
//  SimpleSIP
//
//  Created by Techlites Solution Pvt Ltd on 05/04/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef struct accountDetails {
    NSString* userName;
    NSString* password;
    NSString* server;
    long localPort;
}accountDetails;

typedef void(^RalleeAccountsHandler)(NSDictionary *dict);

@interface RalleeAccounts : NSObject {
    accountDetails acct;
}

+ (id) sharedController;

- (BOOL)registerToSIPServer:(accountDetails)acc;
- (void)processRegState:(NSDictionary *)userInfo;
//- (void)processRegState:(NSNotification *)notification;

- (BOOL) callUsingNumber:(NSString *)number;

@property (nonatomic, copy) RalleeAccountsHandler handler;

@end