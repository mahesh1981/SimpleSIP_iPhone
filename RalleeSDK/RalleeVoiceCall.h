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

#include "RalleeAccounts.h"


@interface RalleeVoiceCall : NSObject {
    
}

- (BOOL) callUserWithUserID:(NSString *)cid
                  andSNName:(NSString *)SNName;

- (BOOL) callUser:(callUserData )callData;

- (BOOL) answerCall;




+ (void)processCallState:(NSNotification *)notification;

@end
