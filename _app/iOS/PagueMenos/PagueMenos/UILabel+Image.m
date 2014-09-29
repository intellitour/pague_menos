//
//  UILabel+Image.m
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 08/08/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import "UILabel+Image.h"

@implementation UILabel (Image)
- (UIImage *)toImage {
    @autoreleasepool {
        // Create a "canvas" (image context) to draw in.
        UIGraphicsBeginImageContext([self bounds].size);
        
        // Make the CALayer to draw in our "canvas".
        [[self layer] renderInContext: UIGraphicsGetCurrentContext()];
        
        // Fetch an UIImage of our "canvas".
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        // Stop the "canvas" from accepting any input.
        UIGraphicsEndImageContext();
        
        // Return the image.
        return image;
    }
}
@end
