//
//  DetalharProdutoViewController.m
//  PagueMenos
//
//  Created by Pedro Henrique on 01/10/14.
//  Copyright (c) 2014 IESB. All rights reserved.
//

#import "DetalharProdutoViewController.h"

@interface DetalharProdutoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgProduto;
@property (weak, nonatomic) IBOutlet UILabel *lbCategoriaProduto;
@property (weak, nonatomic) IBOutlet UIImageView *imgCategoriaProduto;
@property (weak, nonatomic) IBOutlet UILabel *lbNota;
@property (weak, nonatomic) IBOutlet UILabel *lbQtdAvaliacoes;
@property (weak, nonatomic) IBOutlet UILabel *lbNomeProduto;

@end

@implementation DetalharProdutoViewController
@synthesize produto = _produto;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    @autoreleasepool {
        [self setarImagemProduto];
        [self setarImagemCategoria];

        NSString *nomeProduto = [_produto[@"product"] objectAtIndex:0][@"product"][@"productname"];
        NSString *nota = [_produto[@"product"] objectAtIndex:0][@"product"][@"rating"][@"useraveragerating"][@"rating"];
        NSString *qtdAvaliacoes = [_produto[@"product"] objectAtIndex:0][@"product"][@"rating"][@"useraveragerating"][@"numcomments"];
        
        [_lbNota setText:[NSString stringWithFormat:@"%@/10", nota]];
        [_lbQtdAvaliacoes setText:[NSString stringWithFormat:@"Avaliado por %@ usuários.", qtdAvaliacoes]];
        [_lbNomeProduto setText:nomeProduto];
        
    }
}

- (void) setarImagemProduto {
    NSInteger maiorImagem = 0;
    NSString *urlMaior;
    for (NSDictionary *format in [_produto[@"product"] objectAtIndex:0][@"product"][@"thumbnail"][@"formats"]) {
        if ([format[@"formats"][@"width"] integerValue] > maiorImagem) {
            maiorImagem = [format[@"formats"][@"width"] integerValue];
            urlMaior = format[@"formats"][@"url"];
        }
    }
    [_imgProduto setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlMaior]]]];
}
- (void) setarImagemCategoria {
    NSString *urlImgCategoria = _produto[@"category"][@"thumbnail"][@"url"];
    [_imgCategoriaProduto setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlImgCategoria]]]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
