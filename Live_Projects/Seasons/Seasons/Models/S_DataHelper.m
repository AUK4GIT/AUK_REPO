//
//  S_DataHelper.m
//  Seasons
//
//  Created by AUK on 25/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_DataHelper.h"

@implementation S_DataHelper
{

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

}

/*
 *  get ThemeImage Name
 */
- (NSArray *)getThemeImages
{
    return [NSArray arrayWithObjects:@"theme4.png", nil];
}

@end
