//
//  SettingsViewController.m
//  SimpleSIP
//
//  Created by Techlites Solution Pvt Ltd on 28/05/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.allowsMultipleSelection = YES;
    
    shared = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    middleware = [[NSMutableArray alloc] initWithObjects:@"http://murmur-dev.socialcallz.net:8080/rallee-kazoo-test/%@/",@"http://107.21.109.104:8080/rallee-kazoo/%@/", nil];
    
    middlewareURL = shared.middlewareURL;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0)
        return @"Middleware URL";
    else
        return @"Codecs";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    
    return [shared.codecsDict count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"setting";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        if (indexPath.row <2) {
            [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
            
            [cell.textLabel setText:[middleware objectAtIndex:indexPath.row]];
            
            
            
            if ([middlewareURL isEqualToString:[middleware objectAtIndex:indexPath.row]]) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
            else
                cell.accessoryType = UITableViewCellAccessoryNone;
        }
       
    }
    
    if (indexPath.section == 1) {
        [cell.textLabel setFont:[UIFont fontWithName:@"System Bold" size:17]];
        [cell.textLabel setText:[[shared.codecsDict allKeys] objectAtIndex:indexPath.row]];
        
        if( [[shared.codecsDict objectForKey:[[shared.codecsDict allKeys] objectAtIndex:indexPath.row]] intValue] == 1) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }

    }
    
        
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
      
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString* key = [NSString stringWithString:[cell.textLabel text]];
    
    if (!self.tableView.isEditing) {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    if (indexPath.section == 1) {
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
            [shared.codecsDict setValue:[NSNumber numberWithInt:0] forKey:key];
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else {
            [shared.codecsDict setValue:[NSNumber numberWithInt:1] forKey:key];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    else {
        NSIndexPath *indexpath1;
        
        if (indexPath.row == 0) {
            indexpath1 = [NSIndexPath indexPathForRow:1 inSection:0];
        }
        else
           indexpath1 = [NSIndexPath indexPathForRow:0 inSection:0];

        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        middlewareURL = [cell.textLabel text];
        cell = [tableView cellForRowAtIndexPath:indexpath1];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
}

- (IBAction)back:(id)sender {
    shared.middlewareURL = middlewareURL;
    [accs setCodecs:shared.codecsDict middlewareURL:middlewareURL];
    [accs disconnect];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *settingsPath = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"];
    [shared.codecsDict writeToFile:settingsPath atomically:YES];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
   // ViewController* view = [[ViewController alloc] initWithNibName:nil bundle:nil];
   // [view fbLogin:nil];
    [super.view setNeedsDisplay];
}
@end
