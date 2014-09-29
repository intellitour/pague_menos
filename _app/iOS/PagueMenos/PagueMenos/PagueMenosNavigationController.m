//
//  PagueMenosNavigationController.m
//  PagueMenos
//
//  Created by Pedro Henrique on 29/09/14.
//  Copyright (c) 2014 IESB. All rights reserved.
//

#import "PagueMenosNavigationController.h"
#import "UIColor+EasyRGB.h"

@interface PagueMenosNavigationController ()

@end

@implementation PagueMenosNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Philosopher-Bold" size:20]}];
    [self.navigationBar setTintColor:[UIColor colorWithR:171 G:218 B:66 A:1]];
    
}
@end
