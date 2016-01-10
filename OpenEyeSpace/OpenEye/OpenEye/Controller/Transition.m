//
//  Transition.m
//  OpenEye
//
//  Created by by on 16/1/10.
//  Copyright © 2016年 dlm. All rights reserved.
//

#import "Transition.h"
#import "LMHome.h"
#import "LMDetail.h"

@interface PushTransition ()

@end

@implementation PushTransition
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    
    LMHome *fromViewContro = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    LMDetail *toViewContro = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UITableViewCell *selectCell = [[fromViewContro tableView] cellForRowAtIndexPath:[[fromViewContro tableView] indexPathsForSelectedRows].firstObject];
    UIImageView *imageView = [selectCell viewWithTag:200];
    UIView *cellImageSnapshot = [imageView snapshotViewAfterScreenUpdates:YES];
    [cellImageSnapshot setFrame:[containerView convertRect:imageView.frame fromView:imageView.superview]];
    [imageView setHidden:YES];
    
    
    [toViewContro.view setFrame:[transitionContext finalFrameForViewController:toViewContro]];
    toViewContro.view.alpha = 0;
    [toViewContro.imageView setHidden:YES];
    
    [containerView addSubview:toViewContro.view];
    [containerView addSubview:cellImageSnapshot];
    
    CGRect frame = [containerView convertRect:toViewContro.imageView.frame fromView:toViewContro.view];
    
    [UIView animateWithDuration:duration animations:^{
        toViewContro.view.alpha = 1;
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        toViewContro.imageView.image = imageView.image;
        toViewContro.imageView.hidden = NO;
        selectCell.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}
@end


@interface PopTransition ()

@end

@implementation PopTransition

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

@end