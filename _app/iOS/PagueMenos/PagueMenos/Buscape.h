//
//  Buscape.h
//  PagueMenos
//
//  Created by Pedro Henrique on 01/10/14.
//  Copyright (c) 2014 IESB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Buscape : NSObject
+ (instancetype) sharedInstance;
- (void) obterDadosParaProduto: (NSString *) barcode  comCallback: (void (^) (NSDictionary * dados, NSError *erro)) callback;
@end
