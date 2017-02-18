//
//  FeaturesViewController.m
//  PokeList
//
//  Created by apple on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "FeaturesViewController.h"
#import "PokeDataLayer.h"
#import "PokemonFamilyViewController.h"
#import "StringRessources.h"

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
    // Debut affectation des label de la vue
    self.weightLabel.text = [StringRessources getWeightLabel:[Tools getLocaleLanguage]];
    self.heightLabel.text = [StringRessources getHeightLabel:[Tools getLocaleLanguage]];
    // Fin affectation des label de la vue
    self.title = [StringRessources getLoadingMessage:[Tools getLocaleLanguage]];
    self.navigationController.navigationBar.barTintColor = [Tools UIColorFromRGB:0xFFFFFF];
    // Couleur de la police du navigation bar
    self.navigationController.navigationBar.tintColor = [Tools UIColorFromRGB:0xB71C1C];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [Tools UIColorFromRGB:0xB71C1C]}];
    self.featureScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.featureScrollView];
    
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    viewSize.height = self.featureView.frame.size.height + self.featureView.frame.origin.y + 10; // Marge de 10 pixel en dessous du feature view
    viewSize.width = 0;
    
    self.featureScrollView.contentSize = viewSize;
    
    [self loadPokemonDataWithPokemonId:self.currentPokemonId];
}


/// Charge les données avec l'id du pokemon
- (void) loadPokemonDataWithPokemonId:(unsigned short) pokemonId{
    if([Tools isInternetConnected]) {
        [PokeDataLayer getPokemonWithId:pokemonId andFeatureView:self];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Information" message:[StringRessources getNoInternetConnectionMessageWithLocaleString:[Tools getLocaleLanguage]] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * refreshAction = [UIAlertAction actionWithTitle:[StringRessources getTryAgainMessage:[Tools getLocaleLanguage]] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [self loadPokemonDataWithPokemonId:pokemonId];
        }];
        [alertController addAction:refreshAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
