//
//  UIBarButtonItem+FontAwesomeIcon.m
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 13/08/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import "UIBarButtonItem+FontAwesomeIcon.h"
#import <FontAwesome+iOS/NSString+FontAwesome.h>

@implementation UIBarButtonItem (FontAwesomeIcon)
- (void) setIcon: (NSString *) identifier {
    @autoreleasepool {
        [self setTitle:[NSString fontAwesomeIconStringForIconIdentifier:identifier]];
        [self setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"FontAwesome" size:25]} forState:UIControlStateNormal];
        [self setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"FontAwesome" size:25]} forState:UIControlStateHighlighted];
    }
}
@end
