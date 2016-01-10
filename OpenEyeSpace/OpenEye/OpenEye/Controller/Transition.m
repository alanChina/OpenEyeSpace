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
    [containerView setBackgroundColor:[UIColor redColor]];
    
    LMHome *fromViewContro = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    LMDetail *toViewContro = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UITableViewCell *selectCell = [[fromViewContro tableView] cellForRowAtIndexPath:[[fromViewContro tableView] indexPathsForSelectedRows].firstObject];
    UIImageView *imageView = [selectCell viewWithTag:200];
    UIView *cellImageSnapshot = [imageView snapshotViewAfterScreenUpdates:false];
    [cellImageSnapshot setFrame:[containerView convertRect:imageView.frame fromView:imageView.superview]];
//    [imageView setHidden:YES];
    
    [toViewContro.view setFrame:[transitionContext finalFrameForViewController:toViewContro]];
    toViewContro.view.alpha = 0;
    [toViewContro.imageView setHidden:YES];
    
    [containerView addSubview:toViewContro.view];
    [containerView addSubview:cellImageSnapshot];
    
    CGRect frame = [containerView convertRect:toViewContro.imageView.frame fromView:toViewContro.imageView.superview];
    frame.size.width = CGRectGetWidth([UIScreen mainScreen].bounds);
    
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
    UIView *containerView = [transitionContext containerView];
    
    LMDetail *fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    LMHome *toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIView *imageSnapshot = [fromController.imageView snapshotViewAfterScreenUpdates:false];
    imageSnapshot.frame = [containerView convertRect:fromController.imageView.frame fromView:fromController.imageView.superview];
    
    UITableViewCell *cell = [toController.tableView cellForRowAtIndexPath:[toController.tableView indexPathForSelectedRow]];
    UIImageView *imageView = [cell viewWithTag:200];
    toController.view.frame = [transitionContext finalFrameForViewController:toController];
    [containerView insertSubview:toController.view belowSubview:fromController.view];
    [containerView addSubview:imageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        fromController.view.alpha = 0;
        imageSnapshot.frame = [containerView convertRect:imageView.frame fromView:imageView.superview];
        
    } completion:^(BOOL finished) {
        [imageSnapshot removeFromSuperview];
        fromController.imageView.hidden = NO;
        imageView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

@end