//
//  PagueMenosNavigationController.m
//  PagueMenos
//
//  Created by Pedro Henrique on 29/09/14.
//  Copyright (c) 2014 IESB. All rights reserved.
//

#import "PagueMenosNavigationController.h"
#import "UIColor+EasyRGB.h"
#import <Reachability/Reachability.h>

@interface PagueMenosNavigationController ()<UINavigationControllerDelegate>
@property (strong, nonatomic, readonly) UIBarButtonItem *backButton;
@end

@implementation PagueMenosNavigationController
@synthesize backButton = _backButton;

- (UIBarButtonItem *) backButton {
    if (!_backButton) {
        @autoreleasepool {
            _backButton = [[UIBarButtonItem alloc] initWithTitle:@"\uf060" style:UIBarButtonItemStylePlain target:self action:@selector(pop:)];
            [_backButton setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"FontAwesome" size:25]} forState:UIControlStateNormal];
            [_backButton setAccessibilityLabel:@"Voltar"];
            [_backButton setAccessibilityHint:@"Volta para a página anterior."];
            [_backButton setTintColor:[UIColor blackColor]];
        }
    }
    return _backButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDelegate:self];
    
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Philosopher-Bold" size:20]}];
    
    @autoreleasepool {
        Reachability *reachability = [Reachability reachabilityForInternetConnection];
        NetworkStatus internetStatus = [reachability currentReachabilityStatus];
        if (internetStatus == NotReachable) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Acesso à Internet"
                                                            message:@"Para usar este aplicativo, é necessária uma conexão com a internet. Por favor, verifique sua conexão."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [viewController.view becomeFirstResponder];
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    if (index > 0) {
        if (!viewController.navigationItem.hidesBackButton) {
            [viewController.navigationItem setLeftBarButtonItem:self.backButton animated:animated];
        }
    }
}

- (void) pop: (UIBarButtonItem *) sender {
    [self popViewControllerAnimated:YES];
}
@end
