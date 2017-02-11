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
    shareBtn.tintColor = [Tools UIColorFromRGB:0xB71C1C];
    self.navigationItem.rightBarButtonItem = shareBtn;
    [self.view addSubview:self.featureScrollView];
    
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    viewSize.height = self.featureView.frame.size.height + self.featureView.frame.origin.y + 10; // Marge de 10 pixel en dessous du feature view
    viewSize.width = 0;
    
    self.featureScrollView.contentSize = viewSize;
    
    [self loadPokemonDataWithPokemonId:self.currentPokemonId];
}

- (void) sharePokemon:(Pokemon*) pokemon {
    UIImage *image = [Tools getUIImageWithView:self.view];
    
    NSArray* sharedObjects=[NSArray arrayWithObjects:@"sharecontent",  image, nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc]                                                                initWithActivityItems:sharedObjects applicationActivities:nil];
    activityViewController.popoverPresentationController.sourceView = self.view;
    [self presentViewController:activityViewController animated:YES completion:nil];
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
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGSize constraint = CGSizeMake(screenWidth, CGFLOAT_MAX);
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
