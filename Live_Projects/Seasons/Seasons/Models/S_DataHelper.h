//
//  S_DataHelper.h
//  Seasons
//
//  Created by AUK on 25/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface S_DataHelper : NSObject
/**
 * shared Instance
 */
+ (instancetype) sharedInstance;

/*
 *  get ThemeImages Array
 */
- (NSArray *)getThemeImages;

@end
