//
//  ViewController.h
//  SampleSIP
//
//  Created by Techlites Solution Pvt Ltd on 13/02/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "AppDelegate.h"
#import "RalleeSDK.h"
#import <QuartzCore/QuartzCore.h>



@interface ViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, CallHandlerDelegate>{
    IBOutlet UILabel *userName;
    IBOutlet UILabel *statusLabel;
    IBOutlet UITableView* table;
    IBOutlet UITextField *callUser;
    IBOutlet UIButton *loginButton;
    IBOutlet UIButton* callButton;
    
    IBOutlet UIButton *rejectButton;
    IBOutlet UIButton *answerButton;
    
    AppDelegate *shared;
    
    RalleeAccounts* accs2;
    NSMutableArray* friends;
    NSMutableArray* friendsNames;
    NSString* called_user;
    IBOutlet UITextField* numberField;
    IBOutlet UIButton* dialNumberButton;
    IBOutlet UIButton* logoutButton;
    IBOutlet UIButton* cancelCallButton;
    
    BOOL outgoingCall;
    BOOL isAnswering;
    NSString* callerName;
    
   // IBOutlet UILabel *testLabel;
}
- (IBAction)fbLogin:(id)sender;

- (void) callBack:(NSDictionary*)dict2;

- (IBAction)callUser:(id)sender;

- (IBAction)dialNumber:(id)sender;

-(IBAction)answerCall:(id)sender;
-(IBAction)rejectCall:(id)sender;
-(IBAction)logout:(id)sender;

@property (strong, nonatomic) AppDelegate *shared;

@end
