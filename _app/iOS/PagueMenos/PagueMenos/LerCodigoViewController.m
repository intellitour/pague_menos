//
//  ViewController.m
//  TesteBarcode
//
//  Created by Pedro Henrique on 12/06/14.
//  Copyright (c) 2014 Pós em Dispositivos Móveis - IESB. All rights reserved.
//

#import "LerCodigoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "NSString+Utils.h"
#import "UIViewController+ProgressDialog.h"
#import "Buscape.h"
#import "DetalharProdutoViewController.h"

@interface LerCodigoViewController () <AVCaptureMetadataOutputObjectsDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lbValorDetectado;
@property (strong, nonatomic) UIView *destaqueDeteccao;

@property (strong, nonatomic) AVCaptureDevice *dispostivoDeCaptura;
@property (strong, nonatomic) AVCaptureSession *sessaoDeCaptura;
@property (strong, nonatomic) AVCaptureMetadataOutput *saida;
@property (strong, nonatomic) AVCaptureDeviceInput *entrada;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *preVisualizacao;
@end

@implementation LerCodigoViewController

- (UIViewAutoresizing) redimensionarTodaDirecao {
    return
    UIViewAutoresizingFlexibleTopMargin   |
    UIViewAutoresizingFlexibleLeftMargin  |
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleBottomMargin;
}

- (UIView *) destaqueDeteccao {
    if (!_destaqueDeteccao) {
        _destaqueDeteccao = [[UIView alloc] init];
        _destaqueDeteccao.autoresizingMask = [self redimensionarTodaDirecao];
        _destaqueDeteccao.layer.borderColor = [UIColor redColor].CGColor;
        _destaqueDeteccao.layer.borderWidth = 3.5f;
        NSLog(@"Overlay de destaque da detecção criado com sucesso!");
    }
    return _destaqueDeteccao;
}

- (void) iniciarSistemaDeCaptura {
    self.sessaoDeCaptura = [[AVCaptureSession alloc] init];
    self.dispostivoDeCaptura = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *erro = nil;
    
    self.entrada = [AVCaptureDeviceInput deviceInputWithDevice:self.dispostivoDeCaptura error:&erro];
    if (self.entrada) {
        [self.sessaoDeCaptura addInput:self.entrada];
    }else {
        NSLog(@"Erro ao obter dispositivo de entrada. Detalhe: %@",erro);
    }
    
    self.saida = [[AVCaptureMetadataOutput alloc] init];
    [self.saida setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [self.sessaoDeCaptura addOutput:self.saida];
    
    self.saida.metadataObjectTypes = [self.saida availableMetadataObjectTypes]; //todos os tipos de código de barra suportados, incluindo qr-code
    
    self.preVisualizacao = [AVCaptureVideoPreviewLayer layerWithSession:self.sessaoDeCaptura];
    self.preVisualizacao.frame = self.view.bounds;
    self.preVisualizacao.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [self.view.layer addSublayer:self.preVisualizacao];
    
}

- (void) ajustarOrientacaoPreVisualizacao {
    AVCaptureConnection *connection = self.preVisualizacao.connection;
    if ([connection isVideoOrientationSupported]) {
        [connection setVideoOrientation: (AVCaptureVideoOrientation)[[UIApplication sharedApplication] statusBarOrientation]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.destaqueDeteccao];
    [self iniciarSistemaDeCaptura];
    
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.destaqueDeteccao setFrame:CGRectZero];
    
    [self.sessaoDeCaptura startRunning];
    [self.view bringSubviewToFront:self.destaqueDeteccao];
    [self.view bringSubviewToFront:self.lbValorDetectado];
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    self.preVisualizacao.frame = self.view.bounds;
    self.preVisualizacao.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [self ajustarOrientacaoPreVisualizacao];
    
}


- (void) captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    CGRect retanguloDestaque = CGRectZero;
    AVMetadataMachineReadableCodeObject *codigoBarra;
    NSString *valorDetectado = nil;
    
    NSArray *tiposDeCodigoPossiveis = @[AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code,
                                        AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code,
                                        AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];
    
    for (AVMetadataObject *metadata in metadataObjects) {
        for (NSString *tipo in tiposDeCodigoPossiveis) {
            if ([metadata.type isEqualToString:tipo]) {
                codigoBarra = (AVMetadataMachineReadableCodeObject *)[self.preVisualizacao transformedMetadataObjectForMetadataObject:(AVMetadataMachineReadableCodeObject *)metadata];
                retanguloDestaque = codigoBarra.bounds;
                valorDetectado = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
                break;
            }
        }
        if (valorDetectado) {
            if ([valorDetectado isNumeric]) {
                self.lbValorDetectado.text = valorDetectado;
                break;
            }
            break;
        }else {
            self.lbValorDetectado.text = @"(nada detectado)";
        }
    }
    if (![self.lbValorDetectado.text isEqualToString:@"(nada detectado)"]) {
        [self.sessaoDeCaptura stopRunning];
        [self showProgressDialog:@"Buscando informações do produto..."];
        [[Buscape sharedInstance] obterDadosParaProduto:valorDetectado comCallback:^(NSDictionary *dados, NSError *erro) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismissProgressDialog];
                if (!erro) {
                    if (dados[@"product"]) {
                        [self performSegueWithIdentifier:@"mostrarDadosDoProdutoSegue" sender:dados];
                    }else {
                        //TODO: o produto não foi encontrado.
                    }
                }else {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro"
                                                                    message:@"Ocorreu um erro ao obter informações do produto."
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil, nil];
                    [alert show];
                }
            });
        }];
    }
    self.destaqueDeteccao.frame = retanguloDestaque;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self.sessaoDeCaptura stopRunning];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"mostrarDadosDoProdutoSegue"]) {
        DetalharProdutoViewController *destino = segue.destinationViewController;
        [destino setProduto:sender];
    }
}

@end
