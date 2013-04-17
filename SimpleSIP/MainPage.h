//
//  MainPage.h
//  SampleSIP
//
//  Created by Techlites Solution Pvt Ltd on 14/02/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"


@interface MainPage : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    
    
    
    
    IBOutlet UITextField *message;
    
    IBOutlet UIButton *answerButton;
    AppDelegate *shared;
    IBOutlet UITableView *tableView;
    IBOutlet UILabel *name;
    IBOutlet UITextField *numberL;
    
    IBOutlet UITextField *buddyID;
    
    unsigned count;
    
   
}
@property (retain, nonatomic) IBOutlet UIButton *call;
- (IBAction)callNumber:(id)sender;

- (IBAction)refreshBuddies:(id)sender;

- (IBAction)addBuddy:(id)sender;
- (IBAction)answerPressed:(id)sender;

-(void)showAnswer;
- (IBAction)sendMessage:(id)sender;





@end
