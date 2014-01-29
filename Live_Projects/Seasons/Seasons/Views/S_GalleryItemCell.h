//
//  S_GalleryItemCell.h
//  Seasons
//
//  Created by PC268626 on 2/3/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "S_ImageView.h"

@interface S_GalleryItemCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIView *bottomBar;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (strong, nonatomic) IBOutlet S_ImageView *_sImageView;

@end
