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

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pokemonId:(unsigned short) pokeId{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self != nil){
        self.currentPokemonId = pokeId;
    }
    
    return self;
}

- (void)viewDidLoad {
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
    
    /*
     UIScrollView* scrollViewEvol = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     
     [self.view addSubview:scrollViewEvol];*/
    
    [self.mainScrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height)];

    
    
    
    frame.origin.x = [UIScreen mainScreen].bounds.size.width;
    featureView1.view.frame = frame;
    
    [self.mainScrollView addSubview:featureView.view];
    [self.mainScrollView addSubview:featureView1.view];
    
    // [self.scrollViewEvol addSubview:newView];
    
    self.mainScrollView.pagingEnabled = YES;
    
    /*[self addChildViewController:self.bugView];
     [self.scrollView addSubview:self.bugView.view];
     [self.bugView didMoveToParentViewController:self];
     
     CViewController *cViewController = [[CViewController alloc]init];
     CGRect frame = cViewController.view.frame;
     frame.origin.x = 320;
     cViewController.view.frame = frame;
     
     [self addChildViewController:cViewController];
     [self.scrollView addSubview:cViewController.view];
     [cViewController didMoveToParentViewController:self];
     
     self.scrollView.contentSize = CGSizeMake(640, self.view.frame.size.height);
     self.scrollView.pagingEnabled = YES;*/
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    if(UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation])){
        [self.mainScrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, [UIScreen mainScreen].bounds.size.height)];
        CGRect frame = [self.featuresViews objectAtIndex:1].view.frame;
        frame.origin.x = frame.size.width;
        [self.featuresViews objectAtIndex:1].view.frame = frame;
    }else{
        CGRect frame = [self.featuresViews objectAtIndex:1].view.frame;
        frame.origin.x = frame.size.height;
        [self.featuresViews objectAtIndex:1].view.frame = frame;
        [self.mainScrollView setContentSize:CGSizeMake(frame.size.height * 2, frame.size.width)];
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
