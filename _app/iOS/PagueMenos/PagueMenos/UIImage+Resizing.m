//
//  UIImage+Resizing.m
//  Boca No Trombone
//
//  Created by Pedro Henrique on 23/07/14.
//  Copyright (c) 2014 Boca No Trombone LTDA. All rights reserved.
//

#import "UIImage+Resizing.h"

@implementation UIImage (Resizing)

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *) jpegRepresentationForImage: (UIImage *) sourceImage withQuality: (float) jpegQuality {
    NSData *dataForJPEGFile = UIImageJPEGRepresentation(sourceImage, jpegQuality);
    return [UIImage imageWithData:dataForJPEGFile];
}

+ (UIImage *) imageWithImage: (UIImage *) image keepProportionToSize: (CGSize) newSize {
    float width = newSize.width;
    float height = newSize.height;
    
    UIGraphicsBeginImageContext(newSize);
    CGRect rect = CGRectMake(0, 0, width, height);
    
    float widthRatio = image.size.width / width;
    float heightRatio = image.size.height / height;
    float divisor = widthRatio > heightRatio ? widthRatio : heightRatio;
    
    width = image.size.width / divisor;
    height = image.size.height / divisor;
    
    rect.size.width  = width;
    rect.size.height = height;
    
    float offset = (width - height) / 2;
    if (offset > 0) {
        rect.origin.y = offset;
    }
    else {
        rect.origin.x = -offset;
    }
    
    [image drawInRect: rect];
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return smallImage;
}

@end
