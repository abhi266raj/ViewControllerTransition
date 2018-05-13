//
//  CircleCloseVCTransition.m
//  CircleTransition
//
//  Created by AbhirajKumar on 5/13/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import "CircleCloseVCTransition.h"

@implementation CircleCloseVCTransition


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView = transitionContext.containerView;
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [containerView addSubview:toView];
    [containerView addSubview:fromView];
    UIView *circleView = [UIView new];
    
    // [containerView addSubview:circleView];
    circleView.frame = containerView.bounds;
    
    
    toView.frame = containerView.bounds;
    // nextView.center = circleView.center;
    fromView.maskView = circleView;
    
    
    circleView.layer.masksToBounds = true;
    circleView.backgroundColor = [UIColor blackColor];
    CGFloat value =  2;
    circleView.frame = CGRectMake(0, 0, value*containerView.frame.size.height, value * containerView.frame.size.height);
    circleView.center = containerView.center;
    circleView.layer.cornerRadius = (value*containerView.frame.size.height)/2;
    circleView.alpha = 1.0;
    //nextView.alpha = 0.0;
    
    
    //  nextView.layer.cornerRadius = containerView.frame.size.height;
    //nextView.layer.masksToBounds = true;
    //nextView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    CGFloat animationDuration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:animationDuration animations:^{
        circleView.frame = CGRectMake(self.circleCentrePoint.x, self.circleCentrePoint.y, 0, 0);
        // circleView.center = containerView.center;
        circleView.alpha = 0.0;
        circleView.layer.cornerRadius = 0;
        //  nextView.alpha = 1.0;
        
        
        // nextView.layer.cornerRadius = 0;
        // nextView.layer.masksToBounds = NO;
        
    } completion:^(BOOL finished) {
        
        fromView.maskView = nil;
        [transitionContext completeTransition:finished];
    }];
    
}


@end
