//
//  RootViewController.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 14/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"

@interface RootViewController : UIViewController{
    @private
    NSMutableArray<Pokemon*> *pokemonList_;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray<Pokemon*> *pokemonList;
@end
