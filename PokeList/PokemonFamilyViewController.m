//
//  PokemonFamilyViewController.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 05/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "PokemonFamilyViewController.h"
#import "FeaturesViewController.h"

@interface PokemonFamilyViewController ()

@end

@implementation PokemonFamilyViewController

@synthesize featuresViews = featuresViews_;
@synthesize currentPokemonId = currentPokemonId_;

FeaturesViewController *featureView;
FeaturesViewController *featureView1;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pokemonId:(unsigned short) pokeId{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self != nil){
        self.currentPokemonId = pokeId;
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    featureView = [[FeaturesViewController alloc] initWithNibName:@"FeaturesViewController" bundle:nil pokemonId:25];
    featureView1 = [[FeaturesViewController alloc] initWithNibName:@"FeaturesViewController" bundle:nil pokemonId:26];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    frame = featureView1.view.frame;
    frame.origin.x = frame.size.width;
    
    [self.mainScrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 0)];
    
    
    
    frame.origin.x = [UIScreen mainScreen].bounds.size.width;
    featureView1.view.frame = frame;
    
    [self.mainScrollView addSubview:featureView.view];
    [self.mainScrollView addSubview:featureView1.view];
    
    /* Ducplication d'instance
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject: self.bugView];
    
    UIView * newView = [NSKeyedUnarchiver unarchiveObjectWithData: archivedData];
    
    frame.origin.x = [UIScreen mainScreen].bounds.size.width * 2;
    newView.frame = frame;*/
    
    
    self.mainScrollView.pagingEnabled = YES;
    /*
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    FeaturesViewController *featureView;
    FeaturesViewController *featureView1;
    featureView = [[FeaturesViewController alloc] initWithNibName:@"FeaturesViewController" bundle:nil pokemonId:self.currentPokemonId];
    featureView1 = [[FeaturesViewController alloc] initWithNibName:@"FeaturesViewController" bundle:nil pokemonId:self.currentPokemonId+1];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    [self.featuresViews addObject:featureView];
    [self.featuresViews addObject:featureView1];
    
    // featureView.view.frame = [UIScreen mainScreen].bounds;
    
    
    
    frame = featureView1.view.frame;
    frame.origin.x = frame.size.width;
    
    
     UIScrollView* scrollViewEvol = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     
     [self.view addSubview:scrollViewEvol];*
    
    [self.mainScrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height)];

    
    
    
    frame.origin.x = [UIScreen mainScreen].bounds.size.width;
    featureView1.view.frame = frame;
    
    [self.mainScrollView addSubview:featureView.view];
    [self.mainScrollView addSubview:featureView1.view];
    
    // [self.scrollViewEvol addSubview:newView];
    
    self.mainScrollView.pagingEnabled = YES;
    */
    NSLog(@"ScrollView = %f view = %f", self.mainScrollView.frame.size.height, featureView.view.frame.size.height);
    NSLog(@"ScrollView = %f self.view = %f", self.mainScrollView.frame.size.height, self.view.frame.size.height);
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    if(UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation])){
        CGRect frame = featureView.view.frame;
        frame.origin.x = size.width;
        featureView1.view.frame = frame;
        [self.mainScrollView setContentSize:CGSizeMake(size.width* 2, size.height)];
        
        NSLog(@"PKM EVOL.m ++++++++++ PORTRAIT");
        NSLog(@"PKM EVOL.m %f", featureView1.view.frame.origin.x);
        NSLog(@"-->PKM EVOL.m %f", featureView.view.frame.size.width);
    }else{
        CGRect frame = featureView1.view.frame;
        frame.origin.x = frame.size.height;
        featureView1.view.frame = frame;
        [self.mainScrollView setContentSize:CGSizeMake(size.width * 2, size.height)];
        NSLog(@"PKM EVOL.m ++++++++++ LANDSCAPE");
        NSLog(@"PKM EVOL.m width = %f, height = %f", featureView.view.frame.size.width,  featureView.view.frame.size.height);
    }
    
    NSLog(@"##### value size.height = %f || value size.width = %f", size.height, size.width);
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
