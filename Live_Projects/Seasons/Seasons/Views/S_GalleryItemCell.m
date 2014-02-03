//
//  S_GalleryItemCell.m
//  Seasons
//
//  Created by PC268626 on 2/3/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_GalleryItemCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation S_GalleryItemCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
                
    }
    return self;
}

- (void)prepareForReuse
{

}

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted) {
        [self.layer setShadowColor:[UIColor redColor].CGColor] ;
        [self.layer setShadowOffset:CGSizeMake(3, 3)];
}
    else{
//        [self.layer setShadowColor:[UIColor blackColor].CGColor] ;
//        [self.layer setShadowOffset:CGSizeMake(2, 2)];
    }
}

- (void)setSelected:(BOOL)selected
{
    if (selected) {
//        [self.layer setShadowColor:[UIColor redColor].CGColor] ;
//        [self.layer setShadowOffset:CGSizeMake(3, 3)];
    }
    else{
        [self.layer setShadowColor:[UIColor blackColor].CGColor] ;
        [self.layer setShadowOffset:CGSizeMake(2, 2)];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
