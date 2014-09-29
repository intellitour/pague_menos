//
//  UILabel+CustomFont.m
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 25/08/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import "UILabel+CustomFont.h"

@implementation UILabel (CustomFont)
- (void) setFontName: (NSString *) name {
    UIFont *font = [UIFont fontWithName:name size:self.font.pointSize];
    if (font) {
        [self setFont:font];
    }
}
@end
