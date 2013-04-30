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

=======
<<<<<<< HEAD

#include "RalleeAccounts.h"

=======
>>>>>>> a2c9ab9c2da8687f1d4cb362cb40be2cfe3b5a80
#import <UIKit/UIKit.h>
#include "RalleeAccounts.h"
>>>>>>> 7ee917ca9a9dd1cf73eaa574771f100ab6911db0


@interface RalleeVoiceCall : NSObject {
    
}

- (BOOL) callUserWithUserID:(NSString *)cid
                  andSNName:(NSString *)SNName;

- (BOOL) callUser:(callUserData )callData;

- (BOOL) answerCall;




+ (void)processCallState:(NSNotification *)notification;

@end
