//
//  S_DetailsBaseViewController.m
//  Seasons
//
//  Created by AUK on 28/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "S_DetailsBaseViewController.h"
#import "S_GalleryItemCell.h"
#import "S_Helper.h"

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

#pragma mark - Action Items CollectionView DataSources

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    
    S_GalleryItemCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"GalleryItemCell" forIndexPath:indexPath];
    
    CALayer *layer = cell.layer;
    layer.cornerRadius = 10.0;
    layer.masksToBounds = NO;
    [layer setShadowOffset:CGSizeMake(2, 2)];
    [layer setShadowRadius:1.0];
    [layer setShadowColor:[UIColor blackColor].CGColor] ;
    [layer setShadowOpacity:0.5];
    [layer setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:10.0f] CGPath]];
    
    cell.bgView.layer.masksToBounds = YES;
    cell.bgView.layer.cornerRadius = 10.0f;
    
    [cell._sImageView setImageFromURL:[S_Helper getSmallImageURLString:indexPath]];
    
    return cell;
}

@end
