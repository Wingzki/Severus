//
//  UIView+ViewStyle.m
//  PSSViewStyle
//
//  Created by Dai Qinfu on 16/1/15.
//  Copyright © 2016年 Wingzki. All rights reserved.
//

#import "UIView+ViewStyle.h"
#import "PSSViewStyle.h"

@implementation UIView (ViewStyle)

- (void)makeViewStyles:(void(^)(PSSViewStyle *style))block {
    
    PSSViewStyle *style = [[PSSViewStyle alloc] init];
    block(style);
    
    [self setViewStyles:style];
    
}

- (void)setViewStyles:(PSSViewStyle *)style {
    
    if (style.backgroundColor) {
        
        self.backgroundColor = style.backgroundColor;
        
    }
    
    self.alpha  = style.alpha;
    self.hidden = style.hidden;
    
    if (style.borderColor) {
        
        self.layer.borderWidth = style.borderWidth;
        self.layer.borderColor = style.borderColor.CGColor;
        
    }
    
    self.layer.cornerRadius = style.cornerRedius;
    
}

@end
