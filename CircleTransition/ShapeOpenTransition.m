//
//  ShapeOpenTransition.m
//  CircleTransition
//
//  Created by AbhirajKumar on 5/13/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//



#import "ShapeOpenTransition.h"

@interface ShapeOpenTransition ()<CAAnimationDelegate>
@property (nonatomic,strong) void (^ completionHandler)(void);

@end


@implementation ShapeOpenTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}


-(void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *containerView = transitionContext.containerView;
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    

    CGFloat animationDuration = [self transitionDuration:transitionContext];
    
    CGPoint startPoint = self.centrePointAnimation;
    UIBezierPath *beizerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(startPoint.x, startPoint.y, 0, 0)];
    UIBezierPath *beizerPath2;
    if (self.beizerPathFetchBlock){
    beizerPath2 = self.beizerPathFetchBlock(containerView.frame);
    }
    if (!beizerPath2){
    [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-containerView.frame.size.width +startPoint.x , -containerView.frame.size.height+ startPoint.y, 2*containerView.frame.size.width, 2*containerView.frame.size.height)];
    }
    
    CAShapeLayer *shapeLayer = [CAShapeLayer new];
     shapeLayer.path = beizerPath.CGPath;
    toView.layer.mask = shapeLayer;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.fromValue = (__bridge id _Nullable)(beizerPath.CGPath);
    basicAnimation.toValue = (__bridge id _Nullable)(beizerPath2.CGPath);
    basicAnimation.duration = animationDuration;
    basicAnimation.delegate = self;
    
    [basicAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [shapeLayer addAnimation:basicAnimation forKey:@"A"];
    [CATransaction begin];
    //[CATransaction setDisableActions:true];
    shapeLayer.path = beizerPath2.CGPath;
    [CATransaction commit];
    if (self.completionHandler){
        self.completionHandler();
    }
    self.completionHandler = ^{
        toView.layer.mask = nil;
         [transitionContext completeTransition:true];
    };
//    [CATransaction setCompletionBlock:^{
//
//    }];

    
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.completionHandler){
        self.completionHandler();
        self.completionHandler = nil;
        
    }
    
}


@end
