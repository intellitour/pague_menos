//
//  TextoReconhecidoViewController.m
//  TesteOCR
//
//  Created by Pedro Henrique on 11/06/14.
//  Copyright (c) 2014 Pós em Dispositivos Móveis - IESB. All rights reserved.
//

#import "TextoReconhecidoViewController.h"

@interface TextoReconhecidoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation TextoReconhecidoViewController
@synthesize textoReconhecido;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.textView setText:textoReconhecido];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
