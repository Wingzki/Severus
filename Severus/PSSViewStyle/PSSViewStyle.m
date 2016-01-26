//
//  PSSViewStyle.m
//  PSSViewStyle
//
//  Created by Dai Qinfu on 16/1/15.
//  Copyright © 2016年 Wingzki. All rights reserved.
//

#import "PSSViewStyle.h"

@interface PSSViewStyle ()

@property (strong, nonatomic, readwrite) UIColor *backgroundColor;
@property (assign, nonatomic, readwrite) CGFloat alpha;
@property (assign, nonatomic, readwrite) BOOL    hidden;

@property (assign, nonatomic, readwrite) CGFloat cornerRedius;
@property (assign, nonatomic, readwrite) CGFloat borderWidth;
@property (assign, nonatomic, readwrite) UIColor *borderColor;

@property (strong, nonatomic, readwrite) UIFont  *font;
@property (strong, nonatomic, readwrite) UIColor *textColor;
@property (assign, nonatomic, readwrite) NSTextAlignment textAlignment;

@end

@implementation PSSViewStyle

+ (instancetype)createViewStyle:(void(^)(PSSViewStyle *style))block {
    
    PSSViewStyle *style = [[PSSViewStyle alloc] init];
    block(style);
    
    return style;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _alpha         = 1;
        _hidden        = NO;

        _cornerRedius  = 0;
        _borderWidth   = 0;
        _textAlignment = NSTextAlignmentLeft;
        
    }
    return self;
}

- (PSSViewStyle *(^)(UIColor *color))zki_backgroundColor; {
    
    return ^(UIColor *color) {
        
        self.backgroundColor = color;
        
        return self;
    };
    
}

- (PSSViewStyle *(^)(CGFloat alpha))zki_alpha; {
    
    return ^(CGFloat alpha) {
        
        self.alpha = alpha;
        
        return self;
    };
    
}

- (PSSViewStyle *(^)(BOOL hidden))zki_hidden; {
    
    return ^(BOOL hidden) {
        
        self.hidden = hidden;
        
        return self;
    };
    
}

- (PSSViewStyle *(^)(CGFloat cornerRedius))zki_cornerRedius; {
    
    return ^(CGFloat cornerRedius) {
        
        self.cornerRedius = cornerRedius;
        
        return self;
    };
    
}

- (PSSViewStyle *(^)(CGFloat borderWidth))zki_borderWidth; {
    
    return ^(CGFloat borderWidth) {
        
        self.borderWidth = borderWidth;
        
        return self;
    };
    
}

- (PSSViewStyle *(^)(UIColor *borderColor))zki_borderColor; {
    
    return ^(UIColor *borderColor) {
        
        self.borderColor = borderColor;
        
        return self;
    };
    
}

- (PSSViewStyle *(^)(UIColor *color))zki_textColor; {
    
    return ^(UIColor *textColor) {
        
        self.textColor = textColor;
        
        return self;
    };
    
}

- (PSSViewStyle *(^)(UIFont *font))zki_font; {
    
    return ^(UIFont *font) {
        
        self.font = font;
        
        return self;
    };
    
}

- (PSSViewStyle *(^)(NSTextAlignment textAlignment))zki_textAlignment; {
    
    return ^(NSTextAlignment textAlignment) {
        
        self.textAlignment = textAlignment;
        
        return self;
    };
    
}

@end
