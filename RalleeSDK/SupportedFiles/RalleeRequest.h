//
//  RalleeRequest.h
//  SimpleSIP
//
//  Created by Techlites Solution Pvt Ltd on 04/04/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RalleeRequest : NSObject
{
@private
    
    NSString*             _url;
    NSURLConnection*      _connection;
    //NSMutableData*        _responseText;
    
    
#pragma GCC diagnostic pop
    NSError*              _error;
    //BOOL                  _sessionDidExpire;
  

}

@property(nonatomic, copy) NSString *responseString;


/*!
 @abstract
 The HTTPMethod to use for the request, for example "GET" or "POST".
 
 @discussion
 May be used to read the HTTP method that was automatically set during
 the object initiliazation. Make any required modifications prior to
 sending the request.
 */
@property(nonatomic, copy) NSString *HTTPMethod;

/*!
 @abstract
 The parameters for the request.
 
 @discussion
 May be used to read the parameters that were automatically set during
 the object initiliazation. Make any required modifications prior to
 sending the request.
 
 `NSString` parameters are used to generate URL parameter values or JSON
 parameters.  `NSData` and `UIImage` parameters are added as attachments
 to the HTTP body and referenced by name in the URL and/or JSON.
 */
@property(nonatomic, retain, readonly) NSMutableDictionary *parameters;


/*!
 @methodgroup Instance methods
 */

- (id)initWithData:(NSString *)data
                     url:(NSString*)urlString
              HTTPMethod:(NSString *)HTTPMethod;

@end
