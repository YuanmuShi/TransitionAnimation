//
//  CustomPushAnimation.m
//  TransitionAnimation
//
//  Created by Jeffrey on 15/9/19.
//  Copyright © 2015年 Jeffrey. All rights reserved.
//

#import "CustomPushAnimation.h"
#import "CustomCell.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation CustomPushAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext;
{
    return 3.0;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    SecondViewController *toVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    FirstViewController *fromVC = (FirstViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    CustomCell *cell = (CustomCell *)[fromVC.collectionView cellForItemAtIndexPath:[[fromVC.collectionView indexPathsForSelectedItems] firstObject]];
    
    UIView *snapshotView = [cell.imageView snapshotViewAfterScreenUpdates:NO];
    snapshotView.frame = [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.detailImageView.hidden = YES;
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapshotView];
    
    
    [UIView animateWithDuration:2.0 animations:^{
        
        toVC.view.alpha = 1.0;
        [toVC.view layoutSubviews];
        snapshotView.frame = [containerView convertRect:toVC.detailImageView.frame fromView:toVC.view];
    } completion:^(BOOL finished) {
        toVC.detailImageView.hidden = NO;
        cell.imageView.hidden = NO;
        [snapshotView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
    
    
//    [[transitionContext containerView] insertSubview:toVC.view belowSubview:fromVC.view];
//    
//    CGSize screenFrame = [UIScreen mainScreen].bounds.size;
//    
//    toVC.view.transform = CGAffineTransformMakeTranslation(screenFrame.width, screenFrame.height);
//    
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        fromVC.view.transform = CGAffineTransformMakeTranslation(-screenFrame.width, -screenFrame.height);
//        toVC.view.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//        fromVC.view.transform = CGAffineTransformIdentity;
//        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//    }];
}

@end
