//
//  ViewController.m
//  SampleSIP
//
//  Created by Techlites Solution Pvt Ltd on 13/02/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "AppDelegate.h"
#import "MainPage.h"
#import <FacebookSDK/FacebookSDK.h>

#import "RalleeSDK.h"
#import "MainPage.h"

#define fb

//#import "RalleeMiddlewareConnectionController.h"

NSString* kAppId = @"141462222695498";

NSString* fbID;

//#define chandra

@interface ViewController ()

@property (strong, nonatomic) FBRequestConnection *requestConnection;

@end

@implementation ViewController
@synthesize shared;
@synthesize requestConnection;

- (IBAction)callUser:(id)sender {
    
    RalleeVoiceCall* voice = [[RalleeVoiceCall alloc] init];
  
    //BOOL abc = [voice callUserWithUserID:@"" andSNName:@"fb"];
    
    callUserData cud;
    
    cud.called_user = @"100004208564196";
    cud.caller_user = @"816784662";
    cud.sn_type_caller = @"fb";
    cud.sn_type_called = @"fb";
    
    BOOL abc = [voice callUser:cud];
    
    
    if (abc) {
        NSLog(@"yes ");
    }
    else {
        NSLog(@"no ");
    }
    
}

+ (void) accountStatus:(NSNotification *)notification {
    NSLog(@"I am here in the client application");
}

- (void) newUser {
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    
    RalleeReg* ralleeReg = [RalleeReg sharedController];
    UserAuthenticationData ud;
    
    //NSLog(@"********** %@", appDelegate.session.accessToken);
    
#if defined(fb)
    ud.first_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"];
    ud.last_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"];
    ud.email = [[NSUserDefaults standardUserDefaults] objectForKey:@"FBemail"];
    ud.app_ver = @"rallee_2.0";
    ud.SNAccessToken = appDelegate.session.accessToken;
    ud.SNID = [[NSUserDefaults standardUserDefaults] objectForKey:@"FBID"];
    ud.SNUsername = [[NSUserDefaults standardUserDefaults] objectForKey:@"FBusername"];
    ud.SNName = @"fb";
    ud.device_token = @"device_iPhone";
#else
    ud.first_name = @"Joy";//[[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"];
    ud.last_name = @"Banerjee";//[[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"];
    ud.email = @"joy.banerjee@gmail.com";//[[NSUserDefaults standardUserDefaults] objectForKey:@"FBemail"];
    ud.app_ver = @"rallee_2.0";
    ud.SNAccessToken = @"1561vfdsavfsd15165";//appDelegate.session.accessToken;
    ud.SNID = @"joy1";//[[NSUserDefaults standardUserDefaults] objectForKey:@"FBID"];
    ud.SNUsername = @"joy364";//[[NSUserDefaults standardUserDefaults] objectForKey:@"FBusername"];
    ud.SNPassword = @"noPassword";
    ud.SNName = @"rt";
    ud.device_token = @"device_iPhone";
    
#endif
    
    BOOL str = [ralleeReg registerToRallee:ud];
    
    //    id str = [middleware registerToRallee:[[NSDictionary alloc] initWithObjectsAndKeys:[[NSDictionary alloc] initWithObjectsAndKeys: [[NSDictionary alloc] initWithObjectsAndKeys:appDelegate.session.accessToken, @"fb", nil], @"access_tokens", [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%@:%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"FBusername"],[[NSUserDefaults standardUserDefaults] objectForKey:@"FBID"]], @"fb",     nil], @"account_info", nil],@"credentials",     [[NSDictionary alloc] initWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"], @"first_name",      [[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"], @"last_name",      [[NSUserDefaults standardUserDefaults] objectForKey:@"FBemail"], @"email",     @"Rallee_2.0", @"rallee_ver",     nil], @"data", nil]];
    
    if (str)
        NSLog(@"register response : success");
    else
        NSLog(@"register response : failure");
}

- (void)sendRequest:(NSString*)graphPath {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSLog(@"FacebookController::sendRequest-graphPath = %@", graphPath);
    
    // create the connection object
    FBRequestConnection *newConnection = [[FBRequestConnection alloc] init];
    
    // create a handler block to handle the results of the request for fbid's profile
    FBRequestHandler handler =
    ^(FBRequestConnection *connection, id result, NSError *error) {
        // output the results of the request
        [self requestCompleted:connection forFbID:nil result:result error:error];
    };
    
    // create the request object, using the fbid as the graph path
    // as an alternative the request* static methods of the FBRequest class could
    // be used to fetch common requests, such as /me and /me/friends
    FBRequest *request = [[FBRequest alloc] initWithSession:appDelegate.session
                                                  graphPath:graphPath];
    
    // add the request to the connection object, if more than one request is added
    // the connection object will compose the requests as a batch request; whether or
    // not the request is a batch or a singleton, the handler behavior is the same,
    // allowing the application to be dynamic in regards to whether a single or multiple
    // requests are occuring
    [newConnection addRequest:request completionHandler:handler];
    
    // if there's an outstanding connection, just cancel
    [self.requestConnection cancel];
    
    // keep track of our connection, and start it
    self.requestConnection = newConnection;
    [newConnection start];
    
    //    accs2.handler = ^(NSDictionary *dict){
    //
    //        MainPage *main = [[MainPage alloc] initWithNibName:nil bundle:nil];
    //        [self presentViewController:main animated:YES completion:nil];
    //    };

}

- (void)requestCompleted:(FBRequestConnection *)connection
                 forFbID:fbID
                  result:(id)result
                   error:(NSError *)error {
    // not the completion we were looking for...
    if (self.requestConnection &&
        connection != self.requestConnection) {
        return;
    }
    
    NSLog(@"--FB Login Result End-- \n%@", result);
    
    NSLog(@"id of the user : %@", [result objectForKey:@"id"]);
    
    [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"id"] forKey:@"FBID"];
    
    [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"username"] forKey:@"FBusername"];
    
    [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"email"] forKey:@"FBemail"];
    
    // [[NSUserDefaults standardUserDefaults] setObject:@"parlapallichandrasekharreddy@gmail.com" forKey:@"FBemail"];
    
    //[[NSUserDefaults standardUserDefaults] setObject:@"mallick_prasenjit@rediffmail.com" forKey:@"FBemail"];
    
    //[[NSUserDefaults standardUserDefaults] setObject:@"durgesh@techlites.com" forKey:@"FBemail"];
    
    
    
    NSString* name1 = [result objectForKey:@"name"];
    
    NSArray* arr = [name1 componentsSeparatedByString:@" "];
    
    if ([arr count] > 0) {
        [[NSUserDefaults standardUserDefaults] setObject:[arr objectAtIndex:0] forKey:@"firstName"];
        
        if ([arr count] > 1)
            [[NSUserDefaults standardUserDefaults] setObject:[arr objectAtIndex:1] forKey:@"lastName"];
        else
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"lastName"];
    }
    
    if (result==NULL)
        DLog(@"result null");
    
    if(![result isKindOfClass:[NSArray class]])
    {
        if([result objectForKey:@"id"] != nil)
        {
            [self newUser];
            
        }
    }
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"loginfb"];
    // clean this up, for posterity
    self.requestConnection = nil;
}



- (void) updateView {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSLog(@"appdelegate session token %@",appDelegate.session.accessToken);
    
    
    
    if (NULL == appDelegate.session.accessToken) {
        NSLog(@"null token so no request");
        [loginButton setHidden:NO];
    }
    else {
        [self sendRequest:@"me?fields=username,name,id,email"];
        [loginButton setHidden:YES];
    }
}

- (IBAction)fbLogin:(id)sender {
    
    // get the app delegate so that we can access the session property
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    
    appDelegate.session = [[FBSession alloc] initWithAppID:@"141462222695498" permissions:[NSArray arrayWithObjects:@"email", nil] defaultAudience:FBSessionDefaultAudienceFriends urlSchemeSuffix:nil tokenCacheStrategy:nil
                           ];
    
    
    // this button's job is to flip-flop the session from open to closed
    //   if (appDelegate.session.isOpen) {
    // if a user logs out explicitly, we delete any cached token information, and next
    // time they run the applicaiton they will be presented with log in UX again; most
    // users will simply close the app or switch away, without logging out; this will
    // cause the implicit cached-token login to occur on next launch of the application
    //    [appDelegate.session closeAndClearTokenInformation];
    
    
    
    
    
    
    //   }
    // if (appDelegate.session.state != FBSessionStateCreated) {
    // Create a new, logged out session.
    //appDelegate.session = [[FBSession alloc] init];
    // }
    
    // if the session isn't open, let's open it now and present the login UX to the user
    [appDelegate.session openWithCompletionHandler:^(FBSession *session,
                                                     FBSessionState status,
                                                     NSError *error) {
        // and here we make sure to update our UX according to the new session state
        NSLog(@"session token %@",session.accessToken);
        // appDelegate.session.accessToken
        [self updateView];
    }];
}

#pragma mark sip start

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (void) callBack:(NSDictionary*)dict2 {
    NSLog(@"i");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    RalleeReg* middle = [RalleeReg sharedController];
    
    BOOL y = [middle initRalleeSDK:@"myAppKey"];
    
    if (y) {
        NSLog(@"init success");
    }
    else
        NSLog(@"init failed");
    
    accs2 = [RalleeAccounts sharedController];
    
    accs2.handler = ^(NSDictionary* dict) {
        NSLog(@"handler : %@",dict);
    };
    
    shared = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    if (!appDelegate.session.isOpen) {
        // create a fresh session object
        appDelegate.session = [[FBSession alloc] init];
        
        // if we don't have a cached token, a call to open here would cause UX for login to
        // occur; we don't want that to happen unless the user clicks the login button, and so
        // we check here to make sure we have a token before calling open
        if (appDelegate.session.state == FBSessionStateCreatedTokenLoaded) {
            // even though we had a cached token, we need to login to make the session usable
            [appDelegate.session openWithCompletionHandler:^(FBSession *session,
                                                             FBSessionState status,
                                                             NSError *error) {
                // we recurse here, in order to update buttons and labels
                //[self updateView];
            }];
        }
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)dealloc {
    [callUser release];
    [loginButton release];
    [super dealloc];
}
@end
