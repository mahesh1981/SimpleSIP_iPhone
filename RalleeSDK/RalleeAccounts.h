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
    NSString* stunServer;
    NSMutableDictionary* codecsDictionary;
}accountDetails;

typedef void(^RalleeAccountsHandler)(NSDictionary *dict);

@protocol CallHandlerDelegate;

@interface RalleeAccounts : NSObject {
    accountDetails acct;
}

+ (id) sharedController;

- (BOOL)registerToSIPServer:(accountDetails)acc;
- (void)processRegState:(NSDictionary *)userInfo;
//- (void)processRegState:(NSNotification *)notification;

- (BOOL) callUsingNumber:(NSString *)number;
- (void) processCallState:(NSNotification *)notification;

- (void) setCodecs:(NSDictionary *)codecsDict middlewareURL:(NSString *)middlewareURL;

- (NSDictionary *) getCodecs;

- (BOOL) answerCall;
- (BOOL) endCall;
- (BOOL) cancelCall;
-(void)disconnect;
-(void)sendMessage;
-(void)initAcc;


- (void) reconnect;

@property (nonatomic, strong) id<CallHandlerDelegate> delegate;
@property (nonatomic, copy) RalleeAccountsHandler handler;

@end

@protocol CallHandlerDelegate <NSObject>
@optional
// track Call states
-(void)openWithCallBackHandler:(NSDictionary *)notificationDict;

@end
