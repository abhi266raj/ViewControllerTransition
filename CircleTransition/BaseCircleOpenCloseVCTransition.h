//
//  BaseCircleOpenCloseVCTransition.h
//  CircleTransition
//
//  Created by AbhirajKumar on 5/13/18.
//  Copyright © 2018 Personal Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



//Abstract BaseClass
@interface BaseCircleOpenCloseVCTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) CGPoint circleCentrePoint;

@end
