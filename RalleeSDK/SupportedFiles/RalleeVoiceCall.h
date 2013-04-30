//
//  RalleeVoiceCall.h
//  RalleeSDK
//
//  Created by Techlites Solution Pvt Ltd on 15/04/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rallee.h"
#import "RalleeJSON.h"
#import "RalleeRequest.h"
<<<<<<< HEAD
#import <UIKit/UIKit.h>





=======
#include "RalleeAccounts.h"
>>>>>>> b5ab5498f3b424f44188044e91aab2ff65bfdc5a

@interface RalleeVoiceCall : NSObject {
    
}

- (BOOL) callUserWithUserID:(NSString *)cid
                  andSNName:(NSString *)SNName;

- (BOOL) callUser:(callUserData )callData;

- (BOOL) answerCall;




+ (void)processCallState:(NSNotification *)notification;

@end
