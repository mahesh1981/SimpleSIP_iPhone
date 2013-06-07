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
#import "SettingsViewController.h"

NSString* kAppId = @"141462222695498";
NSString* fbID;

//#define thirdParty

#define joy12345
//#define nancy3
//#define fb_3

@interface ViewController ()

@property (strong, nonatomic) FBRequestConnection *requestConnection;

@end

@implementation ViewController
@synthesize shared;
@synthesize requestConnection;

-(IBAction)settings:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"settingsID"];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)logout:(id)sender {
    [table setHidden:YES];
    [callButton setHidden:YES];
    [callUser setHidden:YES];
    
    [rejectButton setHidden:YES];
    [answerButton setHidden:YES];
    [cancelCallButton setHidden:YES];
    [dialNumberButton setHidden:YES];
    [numberField setHidden:YES];
    
    [loginButton setHidden:NO];
    [logoutButton setHidden:YES];
    
    [statusLabel setText:@"Disconnected"];
    
    FBSession* session = [FBSession activeSession];
    [session closeAndClearTokenInformation];
    [session close];
    [FBSession setActiveSession:nil];
    
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    app.session = nil;
    
    NSHTTPCookieStorage* cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray* facebookCookies = [cookies cookiesForURL:[NSURL URLWithString:@"https://facebook.com/"]];
    
    for (NSHTTPCookie* cookie in facebookCookies) {
        [cookies deleteCookie:cookie];
    }
    
    [accs2 disconnect];
    
    [statusLabel setText:@"Logged Out Successfully"];
    
}


- (IBAction)dialNumber:(id)sender {
    RalleeAccounts* r = [RalleeAccounts sharedController];
    [numberField resignFirstResponder];
    

    outgoingCall = YES;


    if ([[numberField text] length] == 0) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No number to dial" message:@"Please enter a number and dial" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }

    else
        [r callUsingNumber:[numberField text]];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* reUseID = @"Friend";
    
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:reUseID];
    [cell.imageView setImage:[UIImage imageNamed:@"def.jpeg"]];
    
    [cell.textLabel setText:[friends objectAtIndex:indexPath.row]];
    [cell.detailTextLabel setText:[friendsNames objectAtIndex:indexPath.row]];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    called_user = [cell.textLabel text];
    [callUser setText:called_user];
}

- (IBAction)callUser:(id)sender {
    
    RalleeVoiceCall* voice = [RalleeVoiceCall sharedController];

    callUserData cud;
    
    

    if ([[callUser text] length] == 0){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No user to call" message:@"Please select a user and call" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else {
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
      //  if ([[callUser text] rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        {
            cud.called_user = [callUser text];
            
#if defined(thirdParty)
            cud.caller_user = [[NSUserDefaults standardUserDefaults] objectForKey:@"SNID"];
            cud.sn_type_caller = [[NSUserDefaults standardUserDefaults] objectForKey:@"SNName"];
            cud.sn_type_called = [[NSUserDefaults standardUserDefaults] objectForKey:@"SNName"];
#else
            cud.caller_user = [[NSUserDefaults standardUserDefaults] objectForKey:@"SNID"];
            cud.sn_type_caller = [[NSUserDefaults standardUserDefaults] objectForKey:@"SNName"];
            cud.sn_type_called = [[NSUserDefaults standardUserDefaults] objectForKey:@"SNName"];
            
#endif
           
            
            BOOL abc = [voice callUser:cud];
            if (abc)
            {
                NSLog(@"calling is succesful");
                outgoingCall = YES;
                
                [statusLabel setText:[NSString stringWithFormat:@"Calling %@", [callUser text]]];
                
                
                [table setHidden:YES];
                [callButton setHidden:YES];
                [callUser setHidden:YES];
                [numberField setHidden:YES];
                [dialNumberButton setHidden:YES];
                [logoutButton setHidden:YES];
                
                //[callButton performSelector:@selector() withObject:nil];
                
                
                [rejectButton setHidden:YES];
                [answerButton setHidden:YES];
                
                [cancelCallButton setHidden:NO];
                
                
                
            }
            else
                NSLog(@"call is unsuccesful");
        }
//        else
//        {
//            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No proper id to call" message:@"Please select a user or enter proper facebook id of the user to call" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//            [alert show];
//        }
    }

}

+ (void) accountStatus:(NSNotification *)notification {
    NSLog(@"I am here in the client application");
}

- (void) newUser {
    
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    
    RalleeReg* ralleeReg = [RalleeReg sharedController];
    UserAuthenticationData ud;
    
    ud.first_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"];
    ud.last_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"];
    ud.email = [[NSUserDefaults standardUserDefaults] objectForKey:@"FBemail"];
    ud.app_ver = @"rallee_2.0";
    ud.SNAccessToken = appDelegate.session.accessToken;
    ud.SNID = [[NSUserDefaults standardUserDefaults] objectForKey:@"SNID"];
    ud.SNUsername = [[NSUserDefaults standardUserDefaults] objectForKey:@"FBusername"];
    ud.SNName = [[NSUserDefaults standardUserDefaults] objectForKey:@"SNName"];
    ud.device_token = @"device_iPhone";
    ud.codecsDictionary = shared.codecsDict;
    ud.middlewareURL = shared.middlewareURL;
    
    [userName setText:[NSString stringWithFormat:@"%@ %@ (%@)",[[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"],[[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"], [[NSUserDefaults standardUserDefaults] objectForKey:@"SNID"]]];
    [statusLabel setText:@"Connecting..."];
   
    BOOL str = [ralleeReg registerToRallee:ud];
    
    if (str)
        NSLog(@"register response : success");
    else
        NSLog(@"register response : failure");
}

- (void)sendRequest:(NSString*)graphPath {
    [statusLabel setText:@"Requesting fb parameters"];
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
    
    [statusLabel setText:@"Received fb parameters"];
    
    NSLog(@"--FB Login Result End-- \n%@", result);
    
    NSLog(@"id of the user : %@", [result objectForKey:@"id"]);
    
    [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"id"] forKey:@"SNID"];
    
    [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"username"] forKey:@"FBusername"];
    [[NSUserDefaults standardUserDefaults] setObject:@"fb" forKey:@"SNName"];
    
    [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"email"] forKey:@"FBemail"];
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

    if (NULL == appDelegate.session.accessToken) {
        NSLog(@"null token so no request");
        [loginButton setHidden:NO];
        [logoutButton setHidden:YES];
    }
    else {
        [self sendRequest:@"me?fields=username,name,id,email"];
        [loginButton setHidden:YES];
    }
}

- (IBAction)rtLogin:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:@"rt" forKey:@"SNName"];
    RalleeReg* ralleeReg = [RalleeReg sharedController];
    UserAuthenticationData ud;
    
#if defined(joy)
    ud.first_name = @"Joy3";
    ud.last_name = @"Banerjee3";
    ud.email = @"joy.banerjee3@gmail.com";
    ud.SNAccessToken = @"1561vfdsavfsd151655";
    ud.SNID = @"joy3";
    ud.SNUsername = @"joy8401";
    ud.SNPassword = @"noPassword";
    
#elif defined(joy12345)
    ud.first_name = @"nancy2";
    ud.last_name = @"p2";
    ud.email = @"np2@rt.com";
    ud.SNAccessToken = @"1561vfdsavfsd151635";
    ud.SNID = @"12345";
    ud.SNUsername = @"np123";
    ud.SNPassword = @"pass";
    
#elif defined(nancy3)
    ud.first_name = @"nancy3";
    ud.last_name = @"p3";
    ud.email = @"np3@rt.com";
    ud.SNAccessToken = @"1561vfdsavfsd151640";
    ud.SNID = @"23456";
    ud.SNUsername = @"np1234";
    ud.SNPassword = @"pass2";
    
    
#elif defined(fb_3)
    ud.first_name = @"Ivan3";
    ud.last_name = @"Stankovic";
    ud.email = @"ivan3@rall.ee";
    ud.SNAccessToken = @"1561vfdsavfsd152445";
    ud.SNID = @"fb_3";
    ud.SNUsername = @"fb_3";
    ud.SNPassword = @"fb_3";
    
#else
    ud.first_name = @"manik";
    ud.last_name = @"tech";
    ud.email = @"m@rt.com";
    ud.SNAccessToken = @"1561vfdsavfsd151655";
    ud.SNID = @"9876543";
    ud.SNUsername = @"maniktech";
    ud.SNPassword = @"pass";
#endif
    
    [[NSUserDefaults standardUserDefaults] setObject:ud.SNID forKey:@"SNID"];
    
    [userName setText:[NSString stringWithFormat:@"%@ %@ (%@)",ud.first_name,ud.last_name, [[NSUserDefaults standardUserDefaults] objectForKey:@"SNID"]]];
    [statusLabel setText:@"Connecting..."];
    
    ud.SNName = [[NSUserDefaults standardUserDefaults] objectForKey:@"SNName"];
    ud.device_token = @"device_iPhone";
    
    ud.app_ver = @"rallee_2.0";
    
    [statusLabel setText:@"Requesting Middleware for authentication"];
    
    BOOL str = [ralleeReg registerToRallee:ud];
    
    if (str)
        NSLog(@"register response : success");
    else
        NSLog(@"register response : failure");

}

#if defined(thirdParty)

- (IBAction)fbLogin:(id)sender {
   // AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    
    RalleeReg* ralleeReg = [RalleeReg sharedController];
   
    UserAuthenticationData ud;
    
#if defined(joy)
    ud.first_name = @"Joy3";
    ud.last_name = @"Banerjee3";
    ud.email = @"joy.banerjee3@gmail.com";
    ud.SNAccessToken = @"1561vfdsavfsd151655";
    ud.SNID = @"joy3";
    ud.SNUsername = @"joy8401";
    ud.SNPassword = @"noPassword";
    
#elif defined(joy12345)
    ud.first_name = @"nancy2";
    ud.last_name = @"p2";
    ud.email = @"np2@rt.com";
    ud.SNAccessToken = @"1561vfdsavfsd151635";
    ud.SNID = @"12345";
    ud.SNUsername = @"np123";
    ud.SNPassword = @"pass";
    
#elif defined(nancy3)
    ud.first_name = @"nancy3";
    ud.last_name = @"p3";
    ud.email = @"np3@rt.com";
    ud.SNAccessToken = @"1561vfdsavfsd151640";
    ud.SNID = @"23456";
    ud.SNUsername = @"np1234";
    ud.SNPassword = @"pass2";
    
    
#elif defined(fb_3)
    ud.first_name = @"Ivan3";
    ud.last_name = @"Stankovic";
    ud.email = @"ivan3@rall.ee";
    ud.SNAccessToken = @"1561vfdsavfsd152445";
    ud.SNID = @"fb_3";
    ud.SNUsername = @"fb_3";
    ud.SNPassword = @"fb_3";
    
#else
    ud.first_name = @"manik";
    ud.last_name = @"tech";
    ud.email = @"m@rt.com";
    ud.SNAccessToken = @"1561vfdsavfsd151655";
    ud.SNID = @"9876543";
    ud.SNUsername = @"maniktech";
    ud.SNPassword = @"pass";
#endif
    
    
    [[NSUserDefaults standardUserDefaults] setObject:ud.SNID forKey:@"SNID"];
    
    [userName setText:[NSString stringWithFormat:@"%@ %@ (%@)",ud.first_name,ud.last_name, [[NSUserDefaults standardUserDefaults] objectForKey:@"SNID"]]];
    [statusLabel setText:@"Connecting..."];
    
    ud.SNName = ;
    ud.device_token = @"device_iPhone";
    
    ud.app_ver = @"rallee_2.0";

    [statusLabel setText:@"Requesting Middleware for authentication"];

    BOOL str = [ralleeReg registerToRallee:ud];

    if (str)
        NSLog(@"register response : success");
    else
        NSLog(@"register response : failure");

}

#else

- (IBAction)fbLogin:(id)sender {
    [statusLabel setText:@"Facebook Login is in process"];
    
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
        [statusLabel setText:@"Facebook Login is complete"];
        [self updateView];
    }];


//    accs2 = [RalleeAccounts sharedController];
//    
//    //NSLog(@"before handler");
//    
//    accs2.handler = ^(NSDictionary* dict) {
//        NSLog(@"handler : %@",dict);
//        
//        NSLog(@"%@ status ", [dict objectForKey:@"StatusText"]);
//        
//        [self.testLabel setText:@"NEW"];
//        [testLabel setText:@"Hello"];
//       
//    };
    
}

#endif

#pragma mark sip start

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) callBack:(NSDictionary*)dict2 {
    NSLog(@"i");
}

-(void)cancelNumberPad{
    [numberField resignFirstResponder];
    numberField.text = @"";
}

-(void)doneWithNumberPad{
   // NSString *numberFromTheKeyboard = numberField.text;
    [numberField resignFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [table setHidden:YES];
    [callButton setHidden:YES];
    [callUser setHidden:YES];
    
    [rejectButton setHidden:YES];
    [answerButton setHidden:YES];
    [cancelCallButton setHidden:YES];
    [dialNumberButton setHidden:YES];
    [numberField setHidden:YES];
    
    [loginButton setHidden:NO];
    [logoutButton setHidden:YES];
    [statusLabel setText:@"connecting..."];
    
    [self fbLogin:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary* dict = [[NSDictionary alloc] init];
    
    
    accs2 = [RalleeAccounts sharedController];
    accs2.delegate=self;
    
    RalleeReg* reg = [RalleeReg sharedController];
    
    BOOL y = [reg initRalleeSDK:@"myAppKey"];
    
    if (y) {
        NSLog(@"init success");
         dict = [accs2 getCodecs];
        
        NSLog(@"dictionary is %@", dict);
        NSLog(@"keys are %@", [dict allKeys]);
    }
    else
        NSLog(@"init failed");
    
    shared = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    callerName = [[NSString alloc] init];
    
    [[answerButton layer] setCornerRadius:5];
    [[rejectButton layer] setCornerRadius:5];
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    numberField.inputAccessoryView = numberToolbar;
    
    
    [table setHidden:YES];
    [callButton setHidden:YES];
    [callUser setHidden:YES];

    [rejectButton setHidden:YES];
    [answerButton setHidden:YES];
    [cancelCallButton setHidden:YES];
    [dialNumberButton setHidden:YES];
    [numberField setHidden:YES];

    isAnswering= NO;

    [statusLabel setText:@""];
    [logoutButton setHidden:YES];
    
    outgoingCall = NO;
    
    friends = [[NSMutableArray alloc] initWithObjects:@"553998562",@"816784662", @"100005730520003", @"100004208564196", @"100000203586379",@"100005636130299", @"100005551420166",nil];
    
    friendsNames = [[NSMutableArray alloc] initWithObjects:@"Bhartesh",@"Chandra's Siphon", @"Chandra's RalleeSIP", @"Joy's RalleeSIP", @"Arun's RalleeSIP", @"NancyPaul's RalleeSIP", @"Manik's_New RalleeSIP",nil];
    
    called_user= [[NSString alloc] init];

    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:
                                                                // @"bg2"
                                                                //  @"bg.jpg"
                                                                  @"bg3.jpg"
                                                                  ]]];
    accs2.handler = ^(NSDictionary* dict) {
        int status = [[NSString stringWithFormat:@"%@",[dict objectForKey:@"Status"]] intValue];
        
        
        NSLog(@"handler : %@ status %@",dict, [dict objectForKey:@"StatusText"]);
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            double delayInSeconds = 3.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                if (status == 200) {
                  //  [userName setText:[NSString stringWithFormat:@"%@ %@ (%@)",[[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"],[[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"], [[NSUserDefaults standardUserDefaults] objectForKey:@"SNID"]]];
                    [statusLabel setText:@"Connected"];
                     [loginButton setHidden:YES];
                    [logoutButton setHidden:NO];
                    [table setHidden:NO];
                    [callButton setHidden:NO];
                    [callUser setHidden:NO];
                    [dialNumberButton setHidden:NO];
                    [numberField setHidden:NO];
                }
                else
                    [loginButton setHidden:NO];
            });
        });

        //dispatch_queue_t main_queue = dispatch_get_main_queue();
        

    };
    
    
    
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
   
   // [accs2 getCodecs];
    
   // [self fbLogin:nil];
}

- (void)openWithCallBackHandler:(NSDictionary*)notificationDict;
{
    NSLog(@"Completion Handler Called");
    
    
    NSLog(@"%@", notificationDict);
    
    NSLog(@"%d",  [[notificationDict objectForKey: @"State"] intValue]);
    
    
    //BOOL outgoingCall = [[NSUserDefaults standardUserDefaults] boolForKey:@"myCallAccept"];
    
    
    NSLog(@"%d", outgoingCall);
    
    //int state = [[notificationDict objectForKey: @"State"] intValue];
    
    NSString *stateStr = [notificationDict objectForKey:@"StateText"];
    
    
    NSLog(@"Before GCD");
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        double delayInSeconds = 0.3;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            
            NSLog(@"inside GCD %@", stateStr);
            NSLog(@"remote contact %@", [notificationDict objectForKey:@"RemoteContact"]);
            NSLog(@"remote callID %@", [notificationDict objectForKey:@"CallID"]);
            NSLog(@"remote info %@", [notificationDict objectForKey:@"RemoteInfo"]);
            
            /*if the call is an incoming call*/
            // if (!outgoingCall && !isAnswering)
            
            callerName = [NSString stringWithFormat:@"%@",[notificationDict objectForKey:@"RemoteInfo"]];
            
            
            NSLog(@"Incoming Call from %@", callerName);
            
            if ([audioPlayer isPlaying]) {
                [audioPlayer stop];
            }
            
            if ([stateStr isEqualToString:@"EARLY"])
            {
                
                
                [table setHidden:YES];
                [callButton setHidden:YES];
                [callUser setHidden:YES];
                [numberField setHidden:YES];
                [dialNumberButton setHidden:YES];
                [logoutButton setHidden:YES];
                
                //[callButton performSelector:@selector() withObject:nil];
                
               
                
                NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/ringtone.mp3", [[NSBundle mainBundle] resourcePath]]];
                
                NSError *error;
                audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
                audioPlayer.numberOfLoops = -1;
                
                if (audioPlayer == nil)
                    NSLog(@"%@", [error description]);
                else 
                    [audioPlayer play];
                
            
                
                [rejectButton setHidden:NO];
                [answerButton setHidden:NO];
                
                NSLog(@"Incoming Call : %@", stateStr);
                
                [statusLabel setText:[NSString stringWithFormat:@"Incoming Call: %@", callerName]];
                
//                if(outgoingCall)
//                    [statusLabel setText:@"Ringing"];
                
            }
            else if ([stateStr isEqualToString:@"DISCONNCTD"])
            {
                
                [table setHidden:NO];
                [callButton setHidden:NO];
                [callUser setHidden:NO];
                [numberField setHidden:NO];
                [dialNumberButton setHidden:NO];
                [logoutButton setHidden:NO];
                
                [answerButton setHidden:YES];
                [rejectButton setHidden:YES];
                [cancelCallButton setHidden:YES];
                
                outgoingCall = NO;
                isAnswering = NO;
                
                
                [statusLabel setText:@"Call Disconnected"];
                
                usleep(3000);
                
                [statusLabel setText:@"Connected"];
                
            }
            if(outgoingCall && ![stateStr isEqualToString:@"DISCONNCTD"])
            {
                [table setHidden:YES];
                [callButton setHidden:YES];
                [callUser setHidden:YES];
                [numberField setHidden:YES];
                [dialNumberButton setHidden:YES];
                [logoutButton setHidden:YES];
                
                //[callButton performSelector:@selector() withObject:nil];
                
                
                [rejectButton setHidden:YES];
                [answerButton setHidden:YES];
                
                [cancelCallButton setHidden:NO];
                
                
            }
            
            if(outgoingCall && ![stateStr isEqualToString:@"EARLY"])
               [statusLabel setText:[NSString stringWithFormat:@"Connecting%@", [callUser text]]];
           if(outgoingCall && [stateStr isEqualToString:@"CONFIRMED"])
           [statusLabel setText:[NSString stringWithFormat:@"Call Connected %@", [callUser text] ]];
            if(outgoingCall && [stateStr isEqualToString:@"DISCONNCTD"])
             [statusLabel setText:@"Call Disconnected"];
        });
    });
}


-(IBAction)answerCall:(id)sender
{
    [answerButton setHidden:YES];
    [rejectButton setHidden:YES];
    
    NSString* str = [statusLabel text];
    
    [statusLabel setText:[NSString stringWithFormat:@"Connected %@",str]];
    
    [accs2 answerCall];
    
    [cancelCallButton setHidden:NO];
    
    
    outgoingCall = NO;
    
    isAnswering= YES;
    
    

}

-(IBAction)rejectCall:(id)sender

{
    callerName = @"";
    [accs2 cancelCall];
    
    [table setHidden:NO];
    [callButton setHidden:NO];
    [callUser setHidden:NO];
    [numberField setHidden:NO];
    [dialNumberButton setHidden:NO];
    [logoutButton setHidden:NO];
    
    [answerButton setHidden:YES];
    [rejectButton setHidden:YES];
    
    outgoingCall = NO;
    
    isAnswering = NO;
    
    
}

-(IBAction)cancelOngoingCall:(id)sender
{
    callerName = @"";
    
    [accs2 endCall];
    
    [cancelCallButton setHidden:YES];
    [table setHidden:NO];
    [callButton setHidden:NO];
    [callUser setHidden:NO];
    [numberField setHidden:NO];
    [dialNumberButton setHidden:NO];
    [logoutButton setHidden:NO];
    
    [answerButton setHidden:YES];
    [rejectButton setHidden:YES];
    
    outgoingCall = NO;
    isAnswering = NO;
    [statusLabel setText:@"Last Call ended"];

}

//-(void)changeStatus
//{
//    [statusLabel setText:@"TEST METHOD"];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [callUser release];
    [loginButton release];
    [statusLabel release];
    [super dealloc];
}
@end
