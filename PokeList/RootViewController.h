//
//  RootViewController.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 14/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"
@class LoadingViewController;

@interface RootViewController : UIViewController{
    @private
    NSMutableArray<Pokemon*> *pokemonList_;
    UIRefreshControl *refreshControl_;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *tableViewMessage;

@property (strong, nonatomic) NSMutableArray<Pokemon*> *pokemonList;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

/// Recharge la table view
- (void) reloadTableView;

/// Verifie l'existance d'une connection internet
/// et charge les éléments dans la tableview
- (void) loadPokemonInTableViewWithLoadingView:(LoadingViewController*) loadingView;

/// Verifie l'existance d'une connection internet
/// et charge les éléments résultant d'une recherche
/// dans la tableview
- (void) loadPokemonSearchResultIntTableView;

@end
