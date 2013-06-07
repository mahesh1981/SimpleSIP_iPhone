//
//  SettingsViewController.h
//  SimpleSIP
//
//  Created by Techlites Solution Pvt Ltd on 28/05/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RalleeSDK.h"
#import "ViewController.h"

@interface SettingsViewController : UITableViewController {
    NSMutableDictionary* codecsDict;
    AppDelegate* shared;
    NSMutableArray* middleware;
    RalleeAccounts* accs;
    NSString* middlewareURL;
}

- (IBAction)back:(id)sender;


@end
