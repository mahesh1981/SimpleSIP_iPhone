//
//  RalleeURLConnection.h
//  SimpleSIP
//
//  Created by Joy on 08/04/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RalleeURLConnection;
typedef void (^RalleeURLConnectionHandler)(RalleeURLConnection *connection,
                NSError *error,
                NSURLResponse *response,
                NSData *responseData);

@interface RalleeURLConnection : NSURLConnection<NSURLConnectionDataDelegate>



- (void)cancel;


@end
