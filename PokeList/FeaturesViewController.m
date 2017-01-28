//
//  FeaturesViewController.m
//  PokeList
//
//  Created by apple on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "FeaturesViewController.h"
#import "PokeDataLayer.h"

@interface FeaturesViewController ()

@end

@implementation FeaturesViewController

@synthesize pokemon = pokemon_;
@synthesize currentPokemonId = currentPokemonId_;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pokemonId:(unsigned short) pokeId{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self != nil){
        self.currentPokemonId = pokeId;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Loading...";
    self.navigationController.navigationBar.barTintColor = [Tools UIColorFromRGB:0xFFFFFF];
    // Couleur de la police du navigation bar
    self.navigationController.navigationBar.tintColor = [Tools UIColorFromRGB:0xB71C1C];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [Tools UIColorFromRGB:0xB71C1C]}];
    self.featureScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.featureScrollView];
    [self.featureScrollView setContentSize:CGSizeMake(0,self.featureView.frame.size.height*1.668)];
    [self.featureScrollView addSubview:self.featureView];
    [self loadPokemonDataWithPokemonId:self.currentPokemonId];
}

- (void) loadPokemonDataWithPokemonId:(unsigned short) pokemonId{
    if([Tools isInternetConnected]){
        [PokeDataLayer getPokemonWithId:pokemonId andFeatureView:self];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Information" message:@"Your phone must be connected to internet to use this app.\n Please check your connection and try again." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *quitAction = [UIAlertAction actionWithTitle:@"Exit" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
            exit(0);
        }];
        
        UIAlertAction * refreshAction = [UIAlertAction actionWithTitle:@"Try again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [self loadPokemonDataWithPokemonId:pokemonId];
        }];
        [alertController addAction:refreshAction];
        [alertController addAction:quitAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
