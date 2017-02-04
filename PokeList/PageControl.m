//
//  PageControl.m
//  PokeList
//
//  Created by apple on 28/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "PageControl.h"

@interface PageControl ()

@end

@implementation PageControl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView* scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width*3, self.view.frame.size.height)];
    [self.view addSubview:scrollview];
    [scrollview setContentSize:CGSizeMake( self.view.frame.size.width*3, self.view.frame.size.height) ];
     
     // Do any additional setup after loading the view, typically from a nib.

     
     scrollview.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
     scrollview.pagingEnabled = YES;
     scrollview.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:(0.5)];
     
    
    
    
     //[scrollViewEvol addSubview:self.fireView];
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
