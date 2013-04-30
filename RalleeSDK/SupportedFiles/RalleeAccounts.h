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

<<<<<<< HEAD
//typedef void(^RalleeCallHandler)(NSInteger state);

@protocol CallHandlerDelegate;
=======
typedef void(^RalleeCallHandler)(NSInteger state);
>>>>>>> b5ab5498f3b424f44188044e91aab2ff65bfdc5a

@interface RalleeAccounts : NSObject {
    accountDetails acct;
}

+ (id) sharedController;

- (BOOL)registerToSIPServer:(accountDetails)acc;
- (void)processRegState:(NSDictionary *)userInfo;
//- (void)processRegState:(NSNotification *)notification;

- (BOOL) callUsingNumber:(NSString *)number;
- (void)processCallState:(NSNotification *)notification;

<<<<<<< HEAD
//- (void)openWithCompletionHandler:(NSInteger)states;
=======

- (void)openWithCompletionHandler:(RalleeCallHandler)handler1;
>>>>>>> b5ab5498f3b424f44188044e91aab2ff65bfdc5a


@property (nonatomic, strong) id<CallHandlerDelegate> delegate;

@property (nonatomic, copy) RalleeAccountsHandler handler;
<<<<<<< HEAD
//@property (nonatomic, copy) RalleeCallHandler callHandler;
=======
@property (nonatomic, copy) RalleeCallHandler callHandler;
>>>>>>> b5ab5498f3b424f44188044e91aab2ff65bfdc5a


@end

@protocol CallHandlerDelegate <NSObject>
@optional
// track Call states
-(void)openWithCallBackHandler:(NSDictionary *)notificationDict;

@end
