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

//#define thirdParty

NSString* kAppId = @"141462222695498";
NSString* fbID;

//#define chandra

@interface ViewController ()

@property (strong, nonatomic) FBRequestConnection *requestConnection;

@end

@implementation ViewController
@synthesize shared;
@synthesize requestConnection;

- (IBAction)logout:(id)sender {
    [loginButton setHidden:NO];
    [logoutButton setHidden:YES];
    
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
    
}


- (IBAction)dialNumber:(id)sender {
    RalleeAccounts* r = [RalleeAccounts sharedController];
    
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
    
    RalleeVoiceCall* voice = [[RalleeVoiceCall alloc] init];

    callUserData cud;
    cud.caller_user = [[NSUserDefaults standardUserDefaults] objectForKey:@"FBID"];
    
    if ([[callUser text] length] == 0){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No user to call" message:@"Please select a user and call" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else {
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        if ([[callUser text] rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        {
            cud.called_user = [callUser text];
            cud.sn_type_caller = @"fb";
            cud.sn_type_called = @"fb";
            
            BOOL abc = [voice callUser:cud];
            if (abc)
                NSLog(@"calling is succesful");
            else
                NSLog(@"call is unsuccesful");
        }
        else {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No proper id to call" message:@"Please select a user or enter proper facebook id of the user to call" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
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
    [statusLabel setText:@"Connecting..."];
   
    BOOL str = [ralleeReg registerToRallee:ud];
    
    //    id str = [middleware registerToRallee:[[NSDictionary alloc] initWithObjectsAndKeys:[[NSDictionary alloc] initWithObjectsAndKeys: [[NSDictionary alloc] initWithObjectsAndKeys:appDelegate.session.accessToken, @"fb", nil], @"access_tokens", [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%@:%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"FBusername"],[[NSUserDefaults standardUserDefaults] objectForKey:@"FBID"]], @"fb",     nil], @"account_info", nil],@"credentials",     [[NSDictionary alloc] initWithObjectsAndKeys:[[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"], @"first_name",      [[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"], @"last_name",      [[NSUserDefaults standardUserDefaults] objectForKey:@"FBemail"], @"email",     @"Rallee_2.0", @"rallee_ver",     nil], @"data", nil]];
    
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
    
    [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"id"] forKey:@"FBID"];
    
    [[NSUserDefaults standardUserDefaults] setObject:[result objectForKey:@"username"] forKey:@"FBusername"];
    
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
        [logoutButton setHidden:NO];
    }
}

#if defined(thirdParty)

- (IBAction)fbLogin:(id)sender {
   // AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    
    RalleeReg* ralleeReg = [RalleeReg sharedController];
    UserAuthenticationData ud;
    

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
   // NSLog(@"%@ %@", self, testLabel);
    
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
    [dialNumberButton setHidden:YES];
    [numberField setHidden:YES];
    [statusLabel setText:@""];
    [logoutButton setHidden:YES];
    
    friends = [[NSMutableArray alloc] initWithObjects:@"553998562",@"816784662", @"100005730520003", @"100004208564196", @"100000203586379",@"100005636130299", @"100005551420166",nil];
    
    friendsNames = [[NSMutableArray alloc] initWithObjects:@"Bhartesh",@"Chandra's Siphon", @"Chandra's RalleeSIP", @"Joy's RalleeSIP", @"Arun's RalleeSIP", @"Manik's RalleeSIP", @"Manik's_New RalleeSIP",nil];
    
    called_user= [[NSString alloc] init];

    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:
                                                                // @"bg2"
                                                                //  @"bg.jpg"
                                                                  @"bg3.jpg"
                                                                  ]]];
    
    RalleeReg* middle = [RalleeReg sharedController];
    
    BOOL y = [middle initRalleeSDK:@"myAppKey"];
    
    if (y) 
        NSLog(@"init success");
    else
        NSLog(@"init failed");
    
   // [callButton setHidden:YES];
    
    accs2 = [RalleeAccounts sharedController];

    
    accs2.delegate=self;
    
    //NSLog(@"before handler");
    
    
    accs2.handler = ^(NSDictionary* dict) {
        int status = [[NSString stringWithFormat:@"%@",[dict objectForKey:@"Status"]] intValue];
        
        
        NSLog(@"handler : %@ status %@",dict, [dict objectForKey:@"StatusText"]);
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            double delayInSeconds = 3.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                if (status == 200) {
                    [statusLabel setText:[NSString stringWithFormat:@"%@ %@ (%@)",[[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"],[[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"], [[NSUserDefaults standardUserDefaults] objectForKey:@"FBID"]]];
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

- (void)openWithCallBackHandler:(NSDictionary*)notificationDict;
{
    NSLog(@"Completion Handler Called");
    
    NSLog(@"%d",  [[notificationDict objectForKey: @"State"] intValue]);
    
    
    //int state = [[notificationDict objectForKey: @"State"] intValue];
    
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        double delayInSeconds = 0.3;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            // [self.testLabel setText:@"NEW"];
            
            //[callButton setHidden:YES];
            
            //[statusLabel setText:@"Incoming Call from %@", ];
            
            
            
            
//            NSLog(@"call state is %@", [notificationDict objectForKey:@""]);
//            
//            if ([stateStr isEqualToString:@"CONFIRMED"])
//                NSLog(@"connected succesfully");
//            else if ([stateStr isEqualToString:@"DISCONNCTD"])
//                NSLog(@"Disconnected");
//            else if ([stateStr isEqualToString:@"CONNECTING"])
//                NSLog(@"Connecting");
//            else if ([stateStr isEqualToString:@"CALLING"])
//                NSLog(@"calling");
//            else {
//                NSLog(@"Calling the answer and the state is %@", stateStr);
            

            
            [table setHidden:YES];
            [callButton setHidden:YES];
            [callUser setHidden:YES];
            [numberField setHidden:YES];
            [dialNumberButton setHidden:YES];
            
            //[callButton performSelector:@selector() withObject:nil];
            
            
            [rejectButton setHidden:NO];
            [answerButton setHidden:NO];
            
            
        });
        
        
    });
    
    

}

-(IBAction)answerCall:(id)sender
{

    
    

}

-(IBAction)rejectCall:(id)sender

{

    
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
