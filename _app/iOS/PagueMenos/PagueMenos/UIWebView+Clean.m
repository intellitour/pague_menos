//
//  UIWebView+Clean.m
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 09/08/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import "UIWebView+Clean.h"

@implementation UIWebView (Clean)
- (void) cleanForDealloc {
    @autoreleasepool {
        [self loadHTMLString:@"" baseURL:nil];
        [self stopLoading];
        self.delegate = nil;
        [self removeFromSuperview];
    }
}
@end
