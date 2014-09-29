//
//  UIColor+EasyRGB.h
//  Boca No Trombone
//
//  Created by Pedro Henrique on 18/07/14.
//  Copyright (c) 2014 Boca No Trombone LTDA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (EasyRGB)
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;
+ (UIColor *)colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
@end
