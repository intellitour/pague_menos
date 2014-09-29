//
//  UITextView+FontName.m
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 12/08/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import "UITextView+FontName.h"

@implementation UITextView (FontName)
- (void) setFontName: (NSString *) font {
    [self setFont:[UIFont fontWithName:font size:self.font.pointSize-2]];
}
@end
