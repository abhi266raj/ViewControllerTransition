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

#import "OutputViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic,strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button = [UIButton new];
    _button.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor redColor];
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
    BaseCircleOpenCloseVCTransition *transition =   [CircleOpenVCTransition new];
   // transition.circleCentrePoint = CGPointMake(200,200);
    return transition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
   // self.isDismissed = true;
   BaseCircleOpenCloseVCTransition *transition =   [CircleCloseVCTransition new];
  //  transition.circleCentrePoint = CGPointMake(200,200);
    return transition;
}

// synchronize with the main animation.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
