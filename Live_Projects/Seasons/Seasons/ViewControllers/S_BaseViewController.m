//
//  S_BaseViewController.m
//  Seasons
//
//  Created by AUK on 25/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_BaseViewController.h"
#import "S_LoginViewController.h"
#import "S_ActionItemCell.h"
#import "S_Helper.h"

@interface S_BaseViewController ()
- (IBAction)loginAction:(id)sender;

@end

@implementation S_BaseViewController
{
    IBOutlet UIImageView *actionItemBGBlurView;
    IBOutlet UICollectionView *actionsItemsCollectionView;
    IBOutlet UIView *actionItemsBGView;
    UIImageView *themeImageView;
    NSArray *getThemeImages;
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
    actionItemBGBlurView.layer.cornerRadius = 10.0f;
    actionItemBGBlurView.layer.masksToBounds = YES;
    [self.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    //Presents Login Screen
    [self performSelector:@selector(loginAction:) withObject:nil afterDelay:0.5];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self performSelector:@selector(maximizeView) withObject:nil afterDelay:0.1];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    //[self minimizeView];
    
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
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    
    S_ActionItemCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"actionItemCell" forIndexPath:indexPath];

    id itemObject = [S_Helper getActionItemObjectAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[itemObject valueForKey:@"imageName"]];
    cell.itemLabel.text = [itemObject valueForKey:@"titleLabel"];

    return cell;
}

#pragma mark - Action Items CollectionView Delegates

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [S_Helper setSelectedAppActionItem:indexPath];
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSelector:@selector(minimizeView) withObject:nil afterDelay:0.2];
    [self performSelector:@selector(loadDetailsView:) withObject:@"ItemSelectionSegue" afterDelay:0.6];
}


#pragma mark - seague method
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

#pragma mark - custom methods

- (void)loadDetailsView:(NSString *)seagueString
{
    [self performSegueWithIdentifier:seagueString sender:self];
}

- (void)maximizeView
{

    [UIView animateWithDuration:0.3 animations:^{
        actionItemsBGView.alpha = 1.0;
        actionItemsBGView.transform = CGAffineTransformIdentity;
    }];

}

- (void)minimizeView
{
    
    [UIView animateWithDuration:0.3 delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        actionItemsBGView.alpha = 0.0;
        actionItemsBGView.transform = CGAffineTransformScale(actionItemsBGView.transform, 0.0, 0.0);
    } completion:nil];
    

}


/*
 *  Creates theme imageView
 */
- (void)createMainThemeImageView
{
    getThemeImages = [[NSArray alloc] initWithArray:[S_Helper getThemeImages]];
    themeImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [themeImageView setImage:[getThemeImages objectAtIndex:0]];
    [self.view addSubview:themeImageView];
    
}

/*
 *  Present LoginView
 */
- (void)PresentLoginView
{
    [self performSegueWithIdentifier:@"PresentLoginView" sender:self];
}

- (IBAction)loginAction:(id)sender {
    
    [self performSelector:@selector(minimizeView) withObject:nil afterDelay:0.2];
    [self performSelector:@selector(PresentLoginView) withObject:@"ItemSelectionSegue" afterDelay:0.6];
}
@end
