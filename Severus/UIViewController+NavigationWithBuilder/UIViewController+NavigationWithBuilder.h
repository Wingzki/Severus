//
//  UIViewController+NavigationWithBuilder.h
//  Severus
//
//  Created by Dai Qinfu on 15/6/9.
//  Copyright (c) 2015年 Wingzki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Builder.h"

@interface UIViewController (NavigationWithBuilder)

+ (instancetype)pushBasedViewController:(UIViewController *)baseViewController
                                builder:(BuilderBlock)block;

+ (instancetype)presentBasedViewController:(UIViewController *)baseViewController
                                   builder:(BuilderBlock)block;


@end
