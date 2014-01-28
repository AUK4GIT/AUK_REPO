//
//  S_DetailsBaseViewController.m
//  Seasons
//
//  Created by AUK on 28/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_DetailsBaseViewController.h"

@interface S_DetailsBaseViewController ()
{

    IBOutlet UIImageView *bgBlurImageView;
}
@end

@implementation S_DetailsBaseViewController

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
    bgBlurImageView.layer.cornerRadius = 10.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
