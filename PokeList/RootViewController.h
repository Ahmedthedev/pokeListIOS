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
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray<Pokemon*> *pokemonList;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

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
