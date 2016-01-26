//
//  UILabel+ViewStyle.m
//  PSSViewStyle
//
//  Created by Dai Qinfu on 16/1/15.
//  Copyright © 2016年 Wingzki. All rights reserved.
//

#import "UILabel+ViewStyle.h"
#import "UIView+ViewStyle.h"

@implementation UILabel (ViewStyle)

- (void)setViewStyles:(PSSViewStyle *)style {
    
    [super setViewStyles:style];
    
    if (style.font) {
        
        self.font = style.font;
        
    }
    
    if (style.textColor) {
        
        self.textColor = style.textColor;
        
    }
    
    self.textAlignment = style.textAlignment;
    
}

@end
