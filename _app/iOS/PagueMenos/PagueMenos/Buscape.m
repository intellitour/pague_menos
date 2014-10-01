//
//  Buscape.m
//  PagueMenos
//
//  Created by Pedro Henrique on 01/10/14.
//  Copyright (c) 2014 IESB. All rights reserved.
//

//http://sandbox.buscape.com/service/findOfferList/564771466d477a4458664d3d/?barcode=7892509063067&format=json

#import "Buscape.h"
#import "UrlParameter.h"
#import <UIKit/UIApplication.h>

@interface Buscape ()
@property (strong, nonatomic) NSOperationQueue *queue;
@end

@implementation Buscape
static dispatch_once_t onceToken;
static Buscape *singletonInstance;


static const NSString *baseURL = @"http://sandbox.buscape.com/service/findOfferList/";
static const NSString *clientId = @"564771466d477a4458664d3d";

- (instancetype) init {
    NSLog(@"Inicialização incorreta. Use desta forma: [Buscape sharedInstance] em vez de [[Buscape alloc] init]");
    abort();
    return nil;
}
- (instancetype) initForSingleton {
    self = [super init];
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

+ (instancetype) sharedInstance {
    dispatch_once(&onceToken, ^{
        singletonInstance = [[Buscape alloc] initForSingleton];
    });
    return singletonInstance;
}


- (NSString *) urlParaBarcode: (NSString *) barcode {
    UrlParameter *pBarcode = [UrlParameter withName:@"barcode" value:barcode];
    UrlParameter *pFormat = [UrlParameter withName:@"format" value:@"json"];
    NSString *retorno = [NSString stringWithFormat:@"%@%@/?%@&%@", baseURL, clientId, pBarcode.encodedPair, pFormat.encodedPair];
    return retorno;
}

- (void) obterDadosParaProduto: (NSString *) barcode  comCallback: (void (^) (NSDictionary * dados, NSError *erro)) callback {
    @autoreleasepool {
        
        NSString *serviceURL = [self urlParaBarcode:barcode];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:serviceURL]];
        [request setHTTPMethod:@"GET"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setTimeoutInterval:30];
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        [NSURLConnection sendAsynchronousRequest:request queue:_queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            if (connectionError) {
                callback(nil, connectionError);
            }else {
                NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
                if (resp.statusCode == 200) {
                    NSError *erroJson;
                    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&erroJson];
                    if (!erroJson) {
                        callback(resultado, nil);
                    }else {
                        callback(nil, erroJson);
                    }
                    
                }else {
                    if (data) {
                        NSLog(@"Error data: %@", [NSString stringWithCString:data.bytes encoding:NSUTF8StringEncoding]);
                    }
                    callback(nil, [NSError errorWithDomain:@"Status HTTP inesperado." code:resp.statusCode userInfo:resp.allHeaderFields]);
                }
            }
            
        }];
    }
}


@end
