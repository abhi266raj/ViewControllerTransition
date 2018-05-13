//
//  BaseOpenCloseToShapeVCTransition.h
//  CircleTransition
//
//  Created by AbhirajKumar on 5/13/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseOpenCloseToShapeVCTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) CGPoint centrePointAnimation;
@property (nonatomic,copy) UIBezierPath * (^beizerPathFetchBlock)(CGRect frame);

@end
