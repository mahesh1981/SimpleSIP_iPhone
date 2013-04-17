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



@interface ViewController : UIViewController <UITextFieldDelegate>{

    IBOutlet UITextField *callUser;
    IBOutlet UIButton *loginButton;
    AppDelegate *shared;
    
    RalleeAccounts* accs2;
}
- (IBAction)fbLogin:(id)sender;

- (void) callBack:(NSDictionary*)dict2;

- (IBAction)callUser:(id)sender;

@property (strong, nonatomic) AppDelegate *shared;

@end
