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

@end

@implementation S_BaseViewController
{
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
    
    //Presents Login Screen
    [self performSelector:@selector(PresentLoginView) withObject:nil afterDelay:0.3];
    
    //Registers Custom Cell
    [actionsItemsCollectionView registerClass:[S_ActionItemCell class] forCellWithReuseIdentifier:@"actionItemCell"];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //[self performSegueWithIdentifier:@"PresentLoginView" sender:self];
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
    cell.backgroundColor = [UIColor yellowColor];
    id itemObject = [S_Helper getActionItemObjectAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[itemObject valueForKey:@"imageName"]];
    cell.itemLabel.text = [itemObject valueForKey:@"titleLabel"];

    return cell;
}

#pragma mark - Action Items CollectionView Delegates

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - seague method
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"PresentLoginView"])
    {
        //S_LoginViewController *loginViewController = [segue destinationViewController];
    }
    
    if ([[segue identifier] isEqualToString:@"ShowAddSightingView"])
    {
//        AddSightingViewController *addSightingViewController = [[[segue destinationViewController] viewControllers] objectAtIndex:0];
//        addSightingViewController.delegate = self;
    }
}

#pragma mark - custom methods
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

@end
