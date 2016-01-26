//
//  PSSViewStyle.h
//  PSSViewStyle
//
//  Created by Dai Qinfu on 16/1/15.
//  Copyright © 2016年 Wingzki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSSViewStyle : NSObject

@property (strong, nonatomic, readonly) UIColor *backgroundColor;
@property (assign, nonatomic, readonly) CGFloat alpha;
@property (assign, nonatomic, readonly) BOOL    hidden;

@property (assign, nonatomic, readonly) CGFloat cornerRedius;
@property (assign, nonatomic, readonly) CGFloat borderWidth;
@property (assign, nonatomic, readonly) UIColor *borderColor;

+ (instancetype)createViewStyle:(void(^)(PSSViewStyle *style))block;

- (PSSViewStyle *(^)(UIColor *color))zki_backgroundColor;
- (PSSViewStyle *(^)(CGFloat alpha))zki_alpha;
- (PSSViewStyle *(^)(BOOL hidden))zki_hidden;

- (PSSViewStyle *(^)(CGFloat cornerRedius))zki_cornerRedius;
- (PSSViewStyle *(^)(CGFloat borderWidth))zki_borderWidth;
- (PSSViewStyle *(^)(UIColor *borderColor))zki_borderColor;

@end

@interface PSSViewStyle (Text)

@property (strong, nonatomic, readonly) UIFont  *font;
@property (strong, nonatomic, readonly) UIColor *textColor;
@property (assign, nonatomic, readonly) NSTextAlignment textAlignment;

- (PSSViewStyle *(^)(UIColor *color))zki_textColor;
- (PSSViewStyle *(^)(UIFont *font))zki_font;
- (PSSViewStyle *(^)(NSTextAlignment textAlignment))zki_textAlignment;

@end
