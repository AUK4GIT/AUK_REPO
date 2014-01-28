//
//  S_ActionItemCell.m
//  Seasons
//
//  Created by AUK on 27/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_ActionItemCell.h"

@implementation S_ActionItemCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        
        [_imageView layer].anchorPoint = CGPointMake(0.5f, 0.5f);
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted) {
        self.imageView.transform = CGAffineTransformMakeScale(1.05, 1.05);
            }
    else{
        self.imageView.transform = CGAffineTransformIdentity;

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
