//
//  FeaturesViewController.m
//  PokeList
//
//  Created by apple on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "FeaturesViewController.h"

@interface FeaturesViewController ()

@end

@implementation FeaturesViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pokemonId:( unsigned short)pokeId{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self != nil){
        /// WEBSERVICE MERCI ON OUBLIE PAS
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
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
