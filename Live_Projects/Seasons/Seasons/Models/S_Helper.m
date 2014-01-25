//
//  S_Helper.m
//  Seasons
//
//  Created by AUK on 25/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_Helper.h"
#import "S_DataHelper.h"

@implementation S_Helper


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


@end
