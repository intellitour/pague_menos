//
//  UIViewController+ProgressDialog.h
//  TrabalhoFinal
//
//  Created by Pedro Henrique on 20/09/14.
//  Copyright (c) 2014 Pedro Henrique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIViewController (ProgressDialog) <MBProgressHUDDelegate>

- (void) showProgressDialog;
- (void) showProgressDialog: (NSString *) text;
- (void) dismissProgressDialog;
- (void) cleanup;

@end
