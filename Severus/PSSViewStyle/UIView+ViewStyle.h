//
//  UIView+ViewStyle.h
//  PSSViewStyle
//
//  Created by Dai Qinfu on 16/1/15.
//  Copyright © 2016年 Wingzki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSSViewStyle.h"

@interface UIView (ViewStyle)

- (void)makeViewStyles:(void(^)(PSSViewStyle *style))block;
- (void)setViewStyles:(PSSViewStyle *)style;

@end
