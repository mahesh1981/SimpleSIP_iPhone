//
//  RalleeError.h
//  SimpleSIP
//
//  Created by Techlites Solution Pvt Ltd on 04/04/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int kGeneralErrorCode = 10000;


@interface RalleeError : NSObject

extern NSString *const RalleeSDKDomain;
extern NSString *const RalleeSDKError;
extern NSString *const RalleeSDKServerError;

typedef enum RalleeErrorCode {
    RalleeErrorInvalid = 0,
    
    RalleeErrorOperationCancelled,
    
    RalleeErrorHTTPError,
    
    
} RalleeErrorCode;


+ (id)formError:(NSInteger)code userInfo:(NSDictionary *) errorData ;

@end
