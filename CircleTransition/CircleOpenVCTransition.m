//
//  CircleOpenVCTransition.m
//  CircleTransition
//
//  Created by AbhirajKumar on 5/13/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import "CircleOpenVCTransition.h"

@implementation CircleOpenVCTransition


-(void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *containerView = transitionContext.containerView;
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    
    UIView *circleView = [UIView new];
    
    // [containerView addSubview:circleView];
    circleView.frame = containerView.bounds;
    
    
    toView.frame = containerView.bounds;
    // nextView.center = circleView.center;
    toView.maskView = circleView;
    
    
    circleView.layer.masksToBounds = true;
    circleView.backgroundColor = [UIColor blackColor];
    CGFloat value =  2;
    
    circleView.frame = CGRectMake(self.circleCentrePoint.x, self.circleCentrePoint.y, 0, 0);
  
    //toView.layer.mask = shapeLayer;
    
    // circleView.center = containerView.center;
    
    circleView.layer.cornerRadius = 0;
    circleView.alpha = 0.0;
    CGFloat animationDuration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:animationDuration animations:^{
        
        
        circleView.frame = CGRectMake(0, 0, value*containerView.frame.size.height, value * containerView.frame.size.height);
        circleView.center = containerView.center;
        circleView.layer.cornerRadius = (value*containerView.frame.size.height)/2;
        circleView.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        
        toView.maskView = nil;
        [transitionContext completeTransition:finished];
    }];
    
}




@end
