//
//  S_Helper.h
//  Seasons
//
//  Created by AUK on 25/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface S_Helper : NSObject

/*
 *  returns theme images
 */
+(NSArray *)getThemeImages;

/*
 *  returns action Item object at index
 */
+(NSArray *)getActionItemObjectAtIndexPath:(NSIndexPath *)indexPath;

/*
 *  set the selected Item
 */
+(void)setSelectedAppActionItem:(NSIndexPath *)indexPath;

/*
 *  get the selected Item
 */
+(id)getActionItemViewControllerToLoad;
@end
