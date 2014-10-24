//
//  Setting.h
//  PagueMenos
//
//  Created by Rosemberg Rodrigues on 29/09/14.
//  Copyright (c) 2014 Rosemberg Rodrigues. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

+ (NSString *)getClientId;
+ (NSString *)getSecretClientId;
+ (NSString *)getUrlCallback;

@end
