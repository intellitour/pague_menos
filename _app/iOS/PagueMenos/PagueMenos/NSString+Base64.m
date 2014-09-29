//
//  NSString+Base64.m
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 31/07/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)

- (NSString *) base64 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:kNilOptions];
}

@end
