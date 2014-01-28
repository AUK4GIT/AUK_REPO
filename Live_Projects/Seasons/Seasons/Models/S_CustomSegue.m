//
//  S_CustomSegue.m
//  Seasons
//
//  Created by AUK on 28/01/14.
//  Copyright (c) 2014 AUK. All rights reserved.
//

#import "S_CustomSegue.h"

@implementation S_CustomSegue

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    return [super initWithIdentifier:identifier source:source destination:destination];
}

- (void)perform
{
    if ([self.identifier isEqualToString:@"ItemSelectionSegue"]) {
        [self animateItemDetailsPresentation];
    }
    else if ([self.identifier isEqualToString:@"DismissItemSelectionSegue"]) {
        [self animateDismissItemDetailsPresentation];
    }
}

#pragma mark - Custom animation methods
/*
 * animates item details screen presentation
 */
- (void)animateItemDetailsPresentation
{
    [[self sourceViewController] presentModalViewController:[self destinationViewController] animated:NO];

    UIView *destinationView = [[self destinationViewController] view];
    destinationView.alpha = 0.0;
    destinationView.transform = CGAffineTransformMakeScale(1.1, 1.1);

        [UIView animateWithDuration:0.3 delay:0.4 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            destinationView.transform = CGAffineTransformIdentity;
            destinationView.alpha = 0.8;
            
        } completion:^(BOOL finished) {
            
    }];

}

/*
 * animates item details screen presentation
 */
- (void)animateDismissItemDetailsPresentation
{
    
    UIView *sourceView = [[self sourceViewController] view];
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        sourceView.transform = CGAffineTransformMakeScale(1.1, 1.1);
        sourceView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [[self sourceViewController] dismissViewControllerAnimated:NO completion:nil];
        sourceView.transform = CGAffineTransformIdentity;
        sourceView.alpha = 0.8;
    }];
    
}


@end
