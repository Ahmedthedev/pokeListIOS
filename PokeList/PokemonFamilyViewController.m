//
//  PokemonFamilyViewController.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 05/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "PokemonFamilyViewController.h"
#import "FeaturesViewController.h"
#import "PokeDataLayer.h"
#import "LoadingViewController.h"

@interface PokemonFamilyViewController ()

@end

@implementation PokemonFamilyViewController

@synthesize featuresViews = featuresViews_;
@synthesize currentPokemonId = currentPokemonId_;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pokemonId:(unsigned short) pokeId{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self != nil){
        self.currentPokemonId = pokeId;
        self.featuresViews = [[NSMutableArray alloc] init];
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [Tools UIColorFromRGB:0xFFFFFF];
    // Couleur de la police du navigation bar
    self.navigationController.navigationBar.tintColor = [Tools UIColorFromRGB:0xB71C1C];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [Tools UIColorFromRGB:0xB71C1C]}];
    UIBarButtonItem* shareBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(sharePokemon:)];
    shareBtn.tintColor = [Tools UIColorFromRGB:0xB71C1C];
    self.navigationItem.rightBarButtonItem = shareBtn;
    [PokeDataLayer getPokemonFamilyWithPokemonFamilyView:self];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.mainScrollView.pagingEnabled = YES;
}

/// Ajout de sous vue dans la scrollView
- (void) addSubViewWithView:(UIView*) view{
    [self.mainScrollView addSubview:view];
}

/// Permet de redefinir les frames des vue en fonction de l'orientation
/// du téléphone (Landscape / Portrait)
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [self.mainScrollView setContentSize:CGSizeMake(size.width* [self.featuresViews count], 0)];
    int count = 0;
    
    for(FeaturesViewController* featuresView in self.featuresViews){
        CGRect frame = featuresView.view.frame;
        frame.origin.x = size.width * count;
        featuresView.view.frame = frame;
        count ++;
    }
}

/// Fonction partage de pokemon
- (void) sharePokemon:(Pokemon*) pokemon {
    UIImage *image = [Tools getUIImageWithView:self.view];
    NSArray* sharedObjects=[NSArray arrayWithObjects:@"Pokelist", image, nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc]                                                                initWithActivityItems:sharedObjects applicationActivities:nil];
    activityViewController.popoverPresentationController.sourceView = self.view;
    [self presentViewController:activityViewController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
