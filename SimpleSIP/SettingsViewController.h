//
//  SettingsViewController.h
//  SimpleSIP
//
//  Created by Techlites Solution Pvt Ltd on 28/05/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SettingsViewController : UITableViewController {
    NSDictionary* codecsDict;
    AppDelegate* shared;
}

@end
