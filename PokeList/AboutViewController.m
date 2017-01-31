//
//  AboutViewController.m
//  PokeList
//
//  Created by Nico on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "AboutViewController.h"

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

- (IBAction)btnshare:(id)sender {
    NSString *textToShare = @"Look at this awesome website for aspiring iOS Developers!";
    
    /*NSArray *objectsToShare = @[textToShare];
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    [self presentViewController:controller animated:YES completion:nil];*/
    
    
    /*NSArray *activityItems = @[textToShare];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        activityViewControntroller.popoverPresentationController.sourceView = self.view;
        activityViewControntroller.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/4, 0, 0);
    }
    [self presentViewController:activityViewControntroller animated:true completion:nil];*/
    
    NSArray* sharedObjects=[NSArray arrayWithObjects:@"sharecontent",  nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc]                                                                initWithActivityItems:sharedObjects applicationActivities:nil];
    activityViewController.popoverPresentationController.sourceView = self.view;
    [self presentViewController:activityViewController animated:YES completion:nil];
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
