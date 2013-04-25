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



@interface ViewController : UIViewController <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>{

    IBOutlet UILabel *statusLabel;
    IBOutlet UITableView* table;
    IBOutlet UITextField *callUser;
    IBOutlet UIButton *loginButton;
    IBOutlet UIButton* callButton;
    AppDelegate *shared;
    
    RalleeAccounts* accs2;
    NSMutableArray* friends;
    NSMutableArray* friendsNames;
    NSString* called_user;
    IBOutlet UITextField* numberField;
    IBOutlet UIButton* dialNum;
    
    IBOutlet UILabel *testLabel;
}
- (IBAction)fbLogin:(id)sender;

- (void) callBack:(NSDictionary*)dict2;

- (IBAction)callUser:(id)sender;

- (IBAction)dialNumber:(id)sender;

@property (strong, nonatomic) AppDelegate *shared;
@property (nonatomic, retain) IBOutlet UILabel *testLabel;

@end
