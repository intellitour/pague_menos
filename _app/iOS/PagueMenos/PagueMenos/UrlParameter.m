//
//  UrlParameter.m
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 09/08/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import "UrlParameter.h"
#import "NSString+Utils.h"

@implementation UrlParameter

@synthesize pair = _pair;
@synthesize encodedPair = _encodedPair;

- (void) dealloc {
    self.pair = nil;
    self.encodedPair = nil;
}

+ (UrlParameter *)withName:(NSString *)name value:(NSString *)value {
    
    UrlParameter *answer = [[UrlParameter alloc] init];
    answer.pair = [NSString stringWithFormat:@"%@=%@", name, value];
    answer.encodedPair = [NSString stringWithFormat:@"%@=%@", [name urlEncode], [value urlEncode]];
    
    return answer;  // autorelease if non-ARC
}

@end
