//
//  FeaturesViewController.m
//  PokeList
//
//  Created by apple on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "AppDelegate.h"
#import "FeaturesViewController.h"
#import "Tools.h"

@interface FeaturesViewController ()

@end

@implementation FeaturesViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pokemonId:( unsigned short)pokeId{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self != nil){
        /// WEBSERVICE MERCI ON OUBLIE PAS
        /// TODO --> Récupérer les données d'un pokemon
        ///          avec la class static PokeDataLayer
        ///          (déjà implémenter)
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [Tools UIColorFromRGB:0xCBCBCB];
    // Couleur de la police du navigation bar
    self.navigationController.navigationBar.tintColor = [Tools UIColorFromRGB:0xB71C1C];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [Tools UIColorFromRGB:0xB71C1C]}];
    self.featureScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.featureScrollView];
    [self.featureScrollView setContentSize:CGSizeMake(0,self.featureView.frame.size.height*1.668)];
    [self.featureScrollView addSubview:self.featureView];
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
