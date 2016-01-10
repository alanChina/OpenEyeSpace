//
//  LMAnimationPresentationSegue.m
//  OpenEye
//
//  Created by by on 16/1/9.
//  Copyright © 2016年 dlm. All rights reserved.
//

#import "LMAnimationPresentationSegue.h"

@interface LMAnimationPresentationSegue ()<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@end

@implementation LMAnimationPresentationSegue
-(void)perform{
    self.destinationViewController.transitioningDelegate = self;
    [super perform];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = transitionContext.containerView;
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    if (toViewController == self.destinationViewController) {
        // Presenting.
        [UIView performWithoutAnimation:^{
            toView.alpha = 0;
            [containerView addSubview:toView];
        }];
        
        NSTimeInterval transitionContextDuration = [self transitionDuration:transitionContext];
        [UIView animateWithDuration:transitionContextDuration animations:^{
            toView.alpha = 1;
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
            
        }];
        
    }else{
        // Dismissing
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        [UIView performWithoutAnimation:^{
            [containerView insertSubview:toView belowSubview:fromView];
            
        }];
        NSTimeInterval transitionContextDuration = [self transitionDuration:transitionContext];
        [UIView animateWithDuration:transitionContextDuration animations:^{
            fromView.alpha = 0;
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
            
        }];
    }
}

@end
