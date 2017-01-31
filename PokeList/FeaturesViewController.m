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
    
    UIBarButtonItem* shareBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(sharePokemon:)];
    shareBtn.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = shareBtn;
    [self.view addSubview:self.featureScrollView];
    CGSize viewSize = self.view.frame.size;
    viewSize.height += 50 + [self getLabelHeight:self.pokeDescription] * 12;
    self.featureScrollView.contentSize = viewSize;
    
    [self loadPokemonDataWithPokemonId:self.currentPokemonId];
}

// A faire
- (void) sharePokemon:(Pokemon*) pokemon {
    
}

- (void) loadPokemonDataWithPokemonId:(unsigned short) pokemonId{
    if([Tools isInternetConnected]) {
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

- (CGFloat)getLabelHeight:(UILabel*)label
{
    CGSize constraint = CGSizeMake(label.frame.size.width, CGFLOAT_MAX);
    CGSize size;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize boundingBox = [label.text boundingRectWithSize:constraint
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:label.font}
                                                  context:context].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    
    return size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
