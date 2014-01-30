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

/*
 *  get Action Name
 */
- (NSArray *)getActionItems;

/*
 * checks if image already cached
 */
- (BOOL)imageInCache:(NSString *)urlString;

/*
 * caches downloaded data
 */
- (void)cacheData:(NSData *)data forKey:(NSString *)urlStrig;


/*
 * fetch cached image
 */
- (UIImage *)getCachedImageForKey:(NSString*)urlString;

/*
 * get Small image URLs
 */
- (NSString *)getSmallImageURLString:(NSInteger)index;

@end
