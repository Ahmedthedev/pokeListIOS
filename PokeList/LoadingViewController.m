//
//  LoadingViewController.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 26/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "LoadingViewController.h"
#import "Tools.h"
#import "StringRessources.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadingMessageLabel.text = [StringRessources getLoadingMessage:[Tools getLocaleLanguage]];
    // Do any additional setup after loading the view from its nib.
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
