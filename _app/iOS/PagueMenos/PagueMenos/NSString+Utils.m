//
//  NSString+Utils.m
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 31/07/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)


-(BOOL)isNullOrEmpty {
    return !(self && self.trim.length);
}
- (NSString *) trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)urlEncodeUsingEncoding:(CFStringEncoding)encoding {
    
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                     (__bridge CFStringRef)self,
                                                                     NULL,
                                                                     CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                     encoding));
}

- (NSString *)urlEncode {
    return [self urlEncodeUsingEncoding:kCFStringEncodingUTF8];
}

- (BOOL) isNumeric {
    NSCharacterSet *notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:notDigits].location == NSNotFound);
}

@end
