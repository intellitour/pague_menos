//
//  UIImage+Resizing.h
//  Boca No Trombone
//
//  Created by Pedro Henrique on 23/07/14.
//  Copyright (c) 2014 Boca No Trombone LTDA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resizing)
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (UIImage *) jpegRepresentationForImage: (UIImage *) sourceImage withQuality: (float) jpegQuality;
+ (UIImage *) imageWithImage: (UIImage *) image keepProportionToSize: (CGSize) newSize;
@end
