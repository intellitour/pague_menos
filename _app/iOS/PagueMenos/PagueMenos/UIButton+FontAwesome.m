//
//  UIButton+FontAwesome.m
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 25/08/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import "UIButton+FontAwesome.h"
#import <FontAwesome+iOS/NSString+FontAwesome.h>

@implementation UIButton (FontAwesome)
- (void) setIcon: (NSString *) identifier {
    @autoreleasepool {
        NSString *title = [NSString fontAwesomeIconStringForIconIdentifier:identifier];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateHighlighted];
        [self.titleLabel setFont:[UIFont fontWithName:@"FontAwesome" size:25]];
    }
}
@end
