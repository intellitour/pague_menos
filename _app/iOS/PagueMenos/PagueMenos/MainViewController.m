//
//  MainViewController.m
//  PagueMenos
//
//  Created by Pedro Henrique on 21/10/14.
//  Copyright (c) 2014 IESB. All rights reserved.
//

#import "MainViewController.h"
#import <MapKit/MapKit.h>

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *mapButtons;
@property (weak, nonatomic) IBOutlet UIButton *btLerCodigo;
@property (weak, nonatomic) IBOutlet UIButton *btPesquisar;
@property (weak, nonatomic) IBOutlet UIButton *btCancelar;
@property (weak, nonatomic) IBOutlet UIButton *btMostrarPosicao;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    @autoreleasepool {
        for (UIButton *bt in _mapButtons) {
            [bt.layer setCornerRadius:bt.frame.size.width/2];
            [bt.layer setBorderColor:[UIColor whiteColor].CGColor];
            [bt.layer setBorderWidth:2];
        }
        [_btMostrarPosicao.layer setCornerRadius:5];
        [_btMostrarPosicao.layer setShadowColor:[UIColor blackColor].CGColor];
        [_btMostrarPosicao.layer setShadowOpacity:0.7];
        [_btMostrarPosicao.layer setShadowOffset:CGSizeMake(3, 3)];
    }
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
