//
//  ViewController.h
//  TesteOCR
//
//  Created by Pedro Henrique on 09/06/14.
//  Copyright (c) 2014 Pós em Dispositivos Móveis - IESB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TesseractOCR/TesseractOCR.h>

@interface ViewController : UIViewController
    <TesseractDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end
