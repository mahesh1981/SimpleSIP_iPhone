//
//  MainPage.m
//  SampleSIP
//
//  Created by Techlites Solution Pvt Ltd on 14/02/13.
//  Copyright (c) 2013 Techlites Solution Pvt Ltd. All rights reserved.
//

#import "MainPage.h"
#import <AudioToolbox/AudioToolbox.h>

@interface MainPage ()

@end

@implementation MainPage

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
        [textField resignFirstResponder];
    return YES;
}

-(void)showAnswer {
    [answerButton setHidden:NO];
}

- (IBAction)sendMessage:(id)sender {
    
  }

- (IBAction)callNumber:(id)sender {
    
    
}


- (IBAction)answerPressed:(id)sender {
  
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ((int)count>0)
       return (int)count;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* reUseID = @"Friend";
    
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:reUseID];
    [cell.imageView setImage:[UIImage imageNamed:@"fbDefault"]];
    
    [name setText:@"name"];
    
    [cell.textLabel setText:@"buddy name"];
    [cell.detailTextLabel setText:@"Status"];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString *sipURI = [cell.textLabel text];
    NSString *str = [NSString stringWithFormat:@"sip:%@@%@",sipURI, shared.server];
    
    NSLog(@"sip uri : %@",str);
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.view addSubview:log];
    
    count = 0;
    shared = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [answerButton setHidden:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(message:)
                                                 name: @"message" object:nil];

    //sip_startup(&(_app_config));
    //sip_connect(_app_config.pool, &(_sip_acc_id));

    
   // [self addAccounts:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_call release];
    [buddyID release];
    [answerButton release];
    [message release];
    [super dealloc];
}

- (void)message:(NSNotification *)notification {
    NSLog(@"in message method");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[ notification userInfo ] objectForKey: @"title"] message:[[ notification userInfo ] objectForKey: @"message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

#pragma mark sip end

- (IBAction)call:(id)sender {    

}

@end
