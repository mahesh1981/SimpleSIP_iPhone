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

@interface RalleeAccounts : NSObject {
    accountDetails acct;
}

+ (id) sharedController;

- (BOOL)registerToSIPServer:(accountDetails)acc;
- (void)processRegState:(NSDictionary *)userInfo;
//- (void)processRegState:(NSNotification *)notification;

- (BOOL) callUsingNumber:(NSString *)number;
<<<<<<< HEAD
- (void)processCallState:(NSNotification *)notification;

//- (void)openWithCompletionHandler:(NSInteger)states;


@property (nonatomic, strong) id<CallHandlerDelegate> delegate;

=======



>>>>>>> b5ab5498f3b424f44188044e91aab2ff65bfdc5a
@property (nonatomic, copy) RalleeAccountsHandler handler;
//@property (nonatomic, copy) RalleeCallHandler callHandler;


@end

@protocol CallHandlerDelegate <NSObject>
@optional
// track Call states
-(void)openWithCallBackHandler:(NSDictionary *)notificationDict;

@end
