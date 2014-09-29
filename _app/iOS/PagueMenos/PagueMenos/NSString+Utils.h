//
//  NSString+Utils.h
//  TurismoAcessivel
//
//  Created by Pedro Henrique on 31/07/14.
//  Copyright (c) 2014 Ministério do Turismo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)
-(BOOL)isNullOrEmpty;
- (NSString *) trim;
- (NSString *)urlEncode;
- (BOOL) isNumeric;
@end
