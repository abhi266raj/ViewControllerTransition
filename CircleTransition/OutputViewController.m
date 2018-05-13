//
//  OutputViewController.m
//  CircleTransition
//
//  Created by AbhirajKumar on 5/13/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import "OutputViewController.h"


@interface OutputViewController()
@property (nonatomic,strong) UIButton *closeButton;
@end

@implementation OutputViewController

-(void)viewDidLoad{
    self.closeButton = [UIButton new];
    [self.view addSubview:self.closeButton];
    [self.closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    self.closeButton.frame = CGRectMake(0, 0, 100, 100);
    [self.closeButton setTitle:@"Close" forState:UIControlStateNormal];
}
-(void)close{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
