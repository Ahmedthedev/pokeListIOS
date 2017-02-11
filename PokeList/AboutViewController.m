//
//  AboutViewController.m
//  PokeList
//
//  Created by Nico on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "AboutViewController.h"
#import "Tools.h"


@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
