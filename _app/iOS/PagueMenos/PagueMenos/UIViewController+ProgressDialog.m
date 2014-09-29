//
//  UIViewController+ProgressDialog.m
//  TrabalhoFinal
//
//  Created by Pedro Henrique on 20/09/14.
//  Copyright (c) 2014 Pedro Henrique. All rights reserved.
//

#import "UIViewController+ProgressDialog.h"
#import <objc/runtime.h>

@implementation UIViewController (ProgressDialog)
static void *ProgressDialogResultKey;


- (void) showProgressDialog {
    [self showProgressDialog:@"Carregando..."];
}
- (void) showProgressDialog: (NSString *) text {
    MBProgressHUD *progressDialog = objc_getAssociatedObject(self, &ProgressDialogResultKey);
    if (!progressDialog) {
        progressDialog = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, progressDialog);
        [progressDialog setAccessibilityTraits:UIAccessibilityTraitUpdatesFrequently];
        [progressDialog setDelegate:self];
        [progressDialog setLabelText:text];
        [progressDialog setRemoveFromSuperViewOnHide:YES];
        [progressDialog setDimBackground:YES];
        [progressDialog setMode:MBProgressHUDModeIndeterminate];
        [progressDialog setMinShowTime:2];
        objc_setAssociatedObject(self, &ProgressDialogResultKey, progressDialog, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }else {
        [progressDialog setLabelText:text];
        [progressDialog show:YES];
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, progressDialog);
    }
}
- (void) dismissProgressDialog {
    MBProgressHUD *progressDialog = objc_getAssociatedObject(self, &ProgressDialogResultKey);
    if (progressDialog) {
        [progressDialog setMode:MBProgressHUDModeText];
        [progressDialog setLabelText:@"Carregamento finalizado."];
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, progressDialog);
        [progressDialog hide:YES afterDelay:3];
    }
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    [self cleanup];
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.navigationItem.titleView);
}

- (void) cleanup {
    MBProgressHUD *progressDialog = objc_getAssociatedObject(self, &ProgressDialogResultKey);
    if (progressDialog) {
        objc_removeAssociatedObjects(progressDialog);
        progressDialog = nil;
        objc_setAssociatedObject(self, &ProgressDialogResultKey, progressDialog, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

@end
