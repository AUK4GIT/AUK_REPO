//
//  S_Helper.m
//  Seasons
//
//  Created by AUK on 25/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_Helper.h"
#import "S_DataHelper.h"
#import "S_Constants.h"

@implementation S_Helper

static AppActionItem appActionItem;

/*
 *  returns theme image
 */
+(NSArray *)getThemeImages
{
    NSArray *imageNamesArray = [[S_DataHelper sharedInstance] getThemeImages];
    NSMutableArray *imagesArray = [NSMutableArray array];
    for (NSInteger i=0; i<[imageNamesArray count]; i++) {
        [imagesArray addObject:[UIImage imageNamed:[imageNamesArray objectAtIndex:i]]];
    }
    return imagesArray;
}

/*
 *  returns action Item object at index
 */
+(NSArray *)getActionItemObjectAtIndexPath:(NSIndexPath *)indexPath
{
    return [[[S_DataHelper sharedInstance] getActionItems] objectAtIndex:indexPath.row];
}

/*
 *  set the selected Item
 */
+(void)setSelectedAppActionItem:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            appActionItem = AppActionItemShopOnline;
            break;
        case 1:
            appActionItem = AppActionItemGallery;
            break;
        case 2:
            appActionItem = AppActionItemCustomOrder;

            break;
        case 3:
            appActionItem = AppActionItemAboutUs;
            break;
        case 4:
            appActionItem = AppActionItemMyAccount;
            break;
        case 5:
            appActionItem = AppActionItemContactUs;
            break;
        default:
            break;
    }
}

/*
 *  get the selected Item
 */
+(id)getActionItemViewControllerToLoad
{
    return nil;
}


/*
 * checks if image already cached
 */
+ (BOOL)imageInCache:(NSString *)urlString
{
    return [[S_DataHelper sharedInstance] imageInCache:urlString];
}

/*
 * caches downloaded data
 */
+ (void)cacheData:(NSData *)data forKey:(NSString *)urlStrig
{
    [[S_DataHelper sharedInstance] cacheData:data forKey:urlStrig];
}

/*
 * fetch cached image
 */
+ (UIImage *)getCachedImageForKey:(NSString*)urlString
{
    return [[S_DataHelper sharedInstance] getCachedImageForKey:urlString];
}

/*
 * get Small image URLs
 */
+ (NSString *)getSmallImageURLString:(NSIndexPath *)indexPath
{
    return [[S_DataHelper sharedInstance] getSmallImageURLString:indexPath.row];
}

@end
