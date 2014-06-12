//
//  ImagemUtils.h
//  TesteOCR
//
//  Created by Pedro Henrique on 11/06/14.
//  Copyright (c) 2014 Pós em Dispositivos Móveis - IESB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImagemUtils : NSObject


UIImage * adequarImagemParaOCR (UIImage * src_img);
- (UIImage *) redimensionarImagem:(UIImage *)imagem paraLargura: (NSUInteger) width eAltura: (NSUInteger) height;
- (UIImage *) converterParaEscalaCinza:(UIImage*)img;


@end
