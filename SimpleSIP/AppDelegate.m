//
//  AppDelegate.m
//  SimpleSIP
//
//  Created by Techlites Solution Pvt Ltd on 19/02/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize server;
@synthesize password;
@synthesize userName;
@synthesize session = _session;
@synthesize codecsDict;
@synthesize middlewareURL;

- (void) setCodecs {
    middlewareURL = [[NSString alloc] initWithString:@"http://murmur-dev.socialcallz.net:8080/rallee-kazoo-test/%@/"];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *settingsPath = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"];
    
    if ([fileManager fileExistsAtPath:settingsPath] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"settings" ofType:@"plist"];
        [fileManager copyItemAtPath:resourcePath toPath:settingsPath error:&error];
        NSLog(@"settings file copied");
    }
    else  {
        NSLog(@"settings file exists");
    }
    
    codecsDict = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    return [self.session handleOpenURL:url];
}


- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    BOOL shouldDimScreen = [UIDevice currentDevice].proximityState;
    
    if (shouldDimScreen) {
        // do whatever you want
    } else {
        // light the screen back up
    }
    
    [self setCodecs];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [FBSession.activeSession handleDidBecomeActive];
     [FBSettings publishInstall:@"141462222695498"];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self.session close];
}

@end
