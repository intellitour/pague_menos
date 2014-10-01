//
//  UrlParameter.h
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 09/08/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlParameter : NSObject
@property (strong, nonatomic) NSString *pair;
@property (strong, nonatomic) NSString *encodedPair;

+ (UrlParameter *)withName:(NSString *)name value:(NSString *)value;
@end
