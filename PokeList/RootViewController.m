//
//  RootViewController.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 14/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation RootViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self != nil){
        UIButton *uIBtnAbout = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [uIBtnAbout addTarget:self action:@selector(btnAbout_Click:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *btnAbout = [[UIBarButtonItem alloc] initWithCustomView:uIBtnAbout];
        uIBtnAbout.tintColor = [UIColor orangeColor];
        self.navigationItem.rightBarButtonItem = btnAbout;
        // data_ = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) btnAbout_Click:(id) sender{
    NSLog(@"DEBUG --> About button was pressed");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // return [data_ count];
    return 3;
}

static NSString* const kCellId = @"azertyuioopqsdfghjklmwxcvbn";

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellId];
    }
    cell.imageView.image = [UIImage imageNamed:@"Pokeball"];
    cell.textLabel.text = [NSString stringWithFormat:@"Pokemon -> %ld", indexPath.row];
    return cell;
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