//
//  ViewController.m
//  CircleTransition
//
//  Created by AbhirajKumar on 5/13/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import "ViewController.h"
#import "CircleOpenVCTransition.h"
#import "CircleCloseVCTransition.h"
#import "ShapeOpenTransition.h"
#import "ShapeCloseTransition.h"


#import "OutputViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic,strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button = [UIButton new];
    _button.frame = CGRectMake(0, 0, 200, 200);
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor redColor];
//    UIBezierPath *beizerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 25, 100, 50)];
//     UIBezierPath *beizerPath2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 25, 200, 100)];
//    
//    CAShapeLayer *shapeLayer = [CAShapeLayer new];
//    //shapeLayer.backgroundColor = [UIColor purpleColor].CGColor;
//    //shapeLayer.fillColor = [UIColor greenColor].CGColor;
//   // shapeLayer.path = beizerPath.CGPath;
//    
//    //[self.button.layer addSublayer:shapeLayer];
//    self.button.layer.mask = shapeLayer;
//    
//    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
//    basicAnimation.fromValue = (__bridge id _Nullable)(beizerPath.CGPath);
//    basicAnimation.toValue = (__bridge id _Nullable)(beizerPath2.CGPath);
//    basicAnimation.duration = 2;
//    
//    [basicAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//    [shapeLayer addAnimation:basicAnimation forKey:@"A"];
//    [CATransaction begin];
//    [CATransaction setDisableActions:true];
//    shapeLayer.path = beizerPath2.CGPath;
//    [CATransaction commit];
    //shapeLayer.frame = _button.frame;
    //shapeLayer.frame =CGRectMake(25, 25, 50, 50);
    [self.button addTarget:self action:@selector(openVC) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)openVC{
    UIViewController *nextViewController = [OutputViewController new];
    nextViewController.view.backgroundColor = [UIColor greenColor];
    nextViewController.transitioningDelegate = self;
    [self presentViewController:nextViewController animated:true completion:nil];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    // self.isDismissed = false;
    ShapeOpenTransition *transition =   [ShapeOpenTransition new];
    transition.centrePointAnimation = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2.0);
    transition.beizerPathFetchBlock = ^UIBezierPath *(CGRect frame) {
      //  frame = CGRectMake(0, 0, frame.size.width*3, frame.size.height*3);
        UIBezierPath* trianglePath = [UIBezierPath bezierPath];
        //CGPoint center = CGPointMake((frame.origin.x + frame.size.width)/2.0, (frame.origin.y + frame.size.height)/2.0);
        [trianglePath moveToPoint:CGPointMake(frame.origin.x, frame.origin.y)];
        [trianglePath addLineToPoint:CGPointMake(frame.origin.x + frame.size.width/2, frame.origin.y +frame.size.height)];
        [trianglePath addLineToPoint:CGPointMake(frame.origin.x + frame.size.width,frame.origin.y)];
        
      //  UIColor *fillColor = [UIColor whiteColor];
        //[fillColor setFill];
        //UIColor *strokeColor = [UIColor whiteColor];
        //[strokeColor setStroke];
        
       // [trianglePath fill];
        //[trianglePath stroke];
        
        [trianglePath closePath];
        return trianglePath;
    };
       
    
   // transition.circleCentrePoint = CGPointMake(200,200);
    return transition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
   // self.isDismissed = true;
   ShapeCloseTransition *transition =   [ShapeCloseTransition new];
    transition.centrePointAnimation = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2.0);
    transition.beizerPathFetchBlock = ^UIBezierPath *(CGRect frame) {
        //  frame = CGRectMake(0, 0, frame.size.width*3, frame.size.height*3);
        UIBezierPath* trianglePath = [UIBezierPath bezierPath];
        //CGPoint center = CGPointMake((frame.origin.x + frame.size.width)/2.0, (frame.origin.y + frame.size.height)/2.0);
        [trianglePath moveToPoint:CGPointMake(frame.origin.x, frame.origin.y)];
        [trianglePath addLineToPoint:CGPointMake(frame.origin.x + frame.size.width/2, frame.origin.y +frame.size.height)];
        [trianglePath addLineToPoint:CGPointMake(frame.origin.x + frame.size.width,frame.origin.y)];
        
        //  UIColor *fillColor = [UIColor whiteColor];
        //[fillColor setFill];
        //UIColor *strokeColor = [UIColor whiteColor];
        //[strokeColor setStroke];
        
        // [trianglePath fill];
        //[trianglePath stroke];
        
        [trianglePath closePath];
        return trianglePath;
    };
  //  transition.circleCentrePoint = CGPointMake(200,200);
    return transition ;
}

// synchronize with the main animation.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
