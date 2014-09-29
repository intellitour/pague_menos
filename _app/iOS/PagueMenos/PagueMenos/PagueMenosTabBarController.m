//
//  PagueMenosTabBarController.m
//  PagueMenos
//
//  Created by Pedro Henrique on 29/09/14.
//  Copyright (c) 2014 IESB. All rights reserved.
//

#import "PagueMenosTabBarController.h"
#import "UIColor+EasyRGB.h"

@interface PagueMenosTabBarController ()

@end

@implementation PagueMenosTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithR:199 G:199 B:199 A:1]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];
    
}

@end
