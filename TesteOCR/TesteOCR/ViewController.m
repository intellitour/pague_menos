//
//  ViewController.m
//  TesteOCR
//
//  Created by Pedro Henrique on 09/06/14.
//  Copyright (c) 2014 Pós em Dispositivos Móveis - IESB. All rights reserved.
//

#import "ViewController.h"
#import "DejalActivityView.h"
#import "TextoReconhecidoViewController.h"
#import "ImagemUtils.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()
@property (strong, nonatomic) Tesseract *tesseract;
@property (strong, nonatomic) UIImage *foto;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *btReconherTexto;
@property (strong, atomic) NSString *textoReconhecido;

@property (strong, nonatomic) DejalActivityView *progressView;

@end

@implementation ViewController
BOOL memoryWarning = false;
@synthesize  textoReconhecido;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Teste OCR";
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.tesseract) {
        NSLog(@"Tesseract inicializado com sucesso! - %@", self.tesseract);
    }
    
    [self.btReconherTexto setHidden:YES];
    self.progressView = [DejalActivityView activityViewForView:self.view withLabel:@"Aguarde..." width:200];
    [self.progressView setHidden:YES];
}

-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (Tesseract *) tesseract {
    if (_tesseract == nil) {
        _tesseract = [[Tesseract alloc] initWithLanguage:@"por"];
        [_tesseract setVariableValue:@".,0123456789" forKey:@"tessedit_char_whitelist"];
        _tesseract.delegate = self;
    }
    return _tesseract;
}
- (IBAction)tirarFoto:(UIButton *)sender {
    
    //Só funciona com um device. O emulador do iOS não tem camera!!!
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.showsCameraControls = YES;
    
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = YES;
    
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
    }else {
        @autoreleasepool {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta"
                                                            message:@"Não foi possível acessar a câmera!\nRodando no emulador?"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *) kUTTypeImage]) {
        self.foto = info[UIImagePickerControllerEditedImage];
        if (!self.foto) {
            self.foto = info[UIImagePickerControllerOriginalImage];
        }
        
        [self performSelectorInBackground:@selector(reconhecerTexto:) withObject:self.foto];
        
        [self.imageView setImage:self.foto];
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void) reconhecerTexto: (UIImage *) imagem {
    
    UIImage *imagemMelhorada = nil;
    @autoreleasepool {
        ImagemUtils *imagemUtils = [[ImagemUtils alloc] init];
        imagemMelhorada = [imagemUtils converterParaEscalaCinza:imagem];
        imagemMelhorada = adequarImagemParaOCR(imagemMelhorada);
        imagemUtils = nil;
    }
    
    if (!imagemMelhorada){
        imagemMelhorada = imagem;
    }
    
    [self.tesseract setImage:imagemMelhorada];
    if ([self.tesseract recognize]) {
        self.textoReconhecido = self.tesseract.recognizedText;
    }
    [self performSelectorOnMainThread:@selector(dismissIndicator) withObject:nil waitUntilDone:NO];
}

-(void) dismissIndicator {
    [self.progressView setHidden:YES];
    [self.btReconherTexto setHidden:NO];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TextoReconhecidoViewController *trvc = segue.destinationViewController;
    [trvc setTextoReconhecido:self.textoReconhecido];
}


-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"Alerta de memória!!!\tViewController");
    memoryWarning = true;
}

-(void) dealloc {
    self.tesseract = nil;
}

#pragma mark - Tesseract Delegate
-(BOOL) shouldCancelImageRecognitionForTesseract:(Tesseract *)tesseract {
    return memoryWarning;
}
-(void) progressImageRecognitionForTesseract:(Tesseract *)tesseract {
    NSLog(@"Progresso do reconhecimento: %i", tesseract.progress);
}

@end
