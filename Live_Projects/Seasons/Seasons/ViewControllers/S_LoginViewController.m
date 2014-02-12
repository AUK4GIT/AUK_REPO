//
//  S_LoginViewController.m
//  Seasons
//
//  Created by AUK on 26/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_LoginViewController.h"

@interface S_LoginViewController ()

- (IBAction)skipLogin:(id)sender;
-(IBAction)textFieldDidEndOnExit:(UITextField *)sender;
@end

@implementation S_LoginViewController
{

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)skipLogin:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)textFieldDidEndOnExit:(UITextField *)sender
{
    
}
@end
