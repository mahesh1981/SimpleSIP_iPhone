//
//  RalleeReg.h
//  Mumble
//
//  Created by ykiryanov on 9/24/12.
//
//

#if PTRACING
#define DLog(...) NSLog(__VA_ARGS__)
#define NoLog(...) /* */
#else
#define DLog(...) /* */
#define NoLog(...) /* */
#endif
#define ALog(...) DLog(__VA_ARGS__)

#import <Foundation/Foundation.h>

#import "Rallee.h"
#import "RalleeJSON.h"

@interface RalleeReg : NSObject<NSURLConnectionDataDelegate>

+ (RalleeReg *) sharedController;

- (BOOL) initRalleeSDK:(NSString *)appkey;
- (BOOL) registerToRallee:(UserAuthenticationData)userData;

@end

