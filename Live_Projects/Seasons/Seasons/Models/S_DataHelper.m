//
//  S_DataHelper.m
//  Seasons
//
//  Created by AUK on 25/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_DataHelper.h"
#import "S_ActionItem.h"

@implementation S_DataHelper
{
    NSArray *_themeImages;
    NSArray *_actionItems;
}

/**
 * shared Instance
 */
+ (instancetype)sharedInstance{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init
{
    if (self = [super init]) {
        [self initialiseDataObjects];
    }
    return self;
}

/**
 * Initialises required Data objects
 */
- (void)initialiseDataObjects
{
    //Initialises theme images for home screen
    _themeImages = [[NSArray alloc] initWithObjects:@"theme4.png", nil];
    
    //Initialise action Items
    [self createInitialActionItems];

}

/**
 * Initialises action Items
 */
- (void)createInitialActionItems
{
    S_ActionItem *actionItem1 = [[S_ActionItem alloc] init];
    actionItem1.imageName = @"act_item1.png";
    actionItem1.titleLabel = @"Shop Online";
    
    S_ActionItem *actionItem2 = [[S_ActionItem alloc] init];
    actionItem2.imageName = @"act_item1.png";
    actionItem2.titleLabel = @"Gallery";
    
    S_ActionItem *actionItem3 = [[S_ActionItem alloc] init];
    actionItem3.imageName = @"act_item1.png";
    actionItem3.titleLabel = @"Custom Order";
    
    S_ActionItem *actionItem4 = [[S_ActionItem alloc] init];
    actionItem4.imageName = @"act_item1.png";
    actionItem4.titleLabel = @"About Us";
    
    S_ActionItem *actionItem5 = [[S_ActionItem alloc] init];
    actionItem5.imageName = @"act_item1.png";
    actionItem5.titleLabel = @"My Account";
    
    S_ActionItem *actionItem6 = [[S_ActionItem alloc] init];
    actionItem6.imageName = @"act_item1.png";
    actionItem6.titleLabel = @"Contact Us";
    
    _actionItems = [[NSArray alloc] initWithObjects:actionItem1,actionItem2,actionItem3,actionItem4,actionItem5,actionItem6, nil];
}


/*
 *  get ThemeImage Name
 */
- (NSArray *)getThemeImages
{
    return _themeImages;
}

/*
 *  get Action Name
 */
- (NSArray *)getActionItems
{
    return _actionItems;
}

@end
