//
//  AppDelegate.h
//  SimpleSIP
//
//  Created by Techlites Solution Pvt Ltd on 19/02/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <FacebookSDK/FacebookSDK.h>

//#include "MainPage.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *server;
    NSString *userName;
    NSString *pwd;
    NSMutableDictionary* codecsDict;
    NSString* middlewareURL;
}

@property (strong, nonatomic) NSMutableDictionary* codecsDict;
@property (strong, nonatomic) NSString* middlewareURL;

@property (strong, nonatomic) FBSession *session;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *server;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *password;


@end
