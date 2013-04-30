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


//typedef void(^RalleeCallHandler)(NSInteger state);

@protocol CallHandlerDelegate;

typedef void(^RalleeCallHandler)(NSInteger state);


@interface RalleeAccounts : NSObject {
    accountDetails acct;
}

+ (id) sharedController;

- (BOOL)registerToSIPServer:(accountDetails)acc;
- (void)processRegState:(NSDictionary *)userInfo;
//- (void)processRegState:(NSNotification *)notification;

- (BOOL) callUsingNumber:(NSString *)number;
- (void)processCallState:(NSNotification *)notification;


- (BOOL) answerCall;
- (BOOL) endCall;
- (BOOL) cancelCall;

- (void)openWithCompletionHandler:(RalleeCallHandler)handler1;


@property (nonatomic, strong) id<CallHandlerDelegate> delegate;
@property (nonatomic, copy) RalleeAccountsHandler handler;

@property (nonatomic, copy) RalleeCallHandler callHandler;


@end

@protocol CallHandlerDelegate <NSObject>
@optional
// track Call states
-(void)openWithCallBackHandler:(NSDictionary *)notificationDict;

@end
