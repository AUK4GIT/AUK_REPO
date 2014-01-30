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
    NSMutableDictionary *_imagesCacheDictionary;
    NSArray *_smallImagesURLArray;
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
    
    _smallImagesURLArray = [[NSArray alloc] initWithObjects:@"http://www.seasons.net.in/Images/Small/1.jpg",@"http://www.seasons.net.in/Images/Small/5.jpg",@"http://www.seasons.net.in/Images/Small/98.jpg",@"http://www.seasons.net.in/Images/Small/95.jpg",@"http://www.seasons.net.in/Images/Small/96.jpg",@"http://www.seasons.net.in/Images/Small/100.jpg",@"http://www.seasons.net.in/Images/Small/101.jpg",@"http://www.seasons.net.in/Images/Small/102.jpg",@"http://www.seasons.net.in/Images/Small/93.jpg",@"http://www.seasons.net.in/Images/Small/103.jpg", nil];
    
    //Initialise imagessCache dict
    _imagesCacheDictionary = [[NSMutableDictionary alloc] init];
    
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

/*
 * checks if image already cached
 */
- (BOOL)imageInCache:(NSString *)urlString
{
    return [[_imagesCacheDictionary allKeys] containsObject:urlString];
}

/*
 * caches downloaded data
 */
- (void)cacheData:(NSData *)data forKey:(NSString *)urlStrig
{
    [_imagesCacheDictionary setObject:data forKey:urlStrig];
}

/*
 * fetch cached image
 */
- (UIImage *)getCachedImageForKey:(NSString*)urlString
{
    return [UIImage imageWithData:[_imagesCacheDictionary objectForKey:urlString]];
}

/*
 * get Small image URLs
 */
- (NSString *)getSmallImageURLString:(NSInteger)index
{
    if (index < [_smallImagesURLArray count])
        return [_smallImagesURLArray objectAtIndex:index];
    else
        return nil;
}


@end
