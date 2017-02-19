//
//  RootViewController.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 14/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "RootViewController.h"
#import "PokemonTableViewCell.h"
#import "AboutViewController.h"
#import "FeaturesViewController.h"
#import "LoadingViewController.h"
#import "PokemonFamilyViewController.h"
#import "PokemonPositionViewController.h"
#import "Tools.h"
#import "Pokemon.h"
#import "PokeDataLayer.h"
#import "StringRessources.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@end

@implementation RootViewController

@synthesize pokemonList = pokemonList_;
@synthesize refreshControl = refreshControl_;

static NSString* const kCellId = @"Cell";

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self != nil){
        // Placé la searchbar sous la navigation bar
        self.edgesForExtendedLayout = UIRectEdgeNone;
        UIButton *uIBtnAbout = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [uIBtnAbout addTarget:self action:@selector(btnAbout_Click:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *btnAbout = [[UIBarButtonItem alloc] initWithCustomView:uIBtnAbout];
        uIBtnAbout.tintColor = [UIColor whiteColor];
        UIImage *image = [UIImage imageNamed:@"globe"];
        
        UIBarButtonItem *btnPokePosition = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"globe"] style:UIBarButtonItemStylePlain target:self action:@selector(btnPokePosition_Click:)];
        self.navigationItem.rightBarButtonItem = btnAbout;
        self.navigationItem.leftBarButtonItem = btnPokePosition;
        /// Chargement du xib de la cellule custom dans la tableView
        [self.tableView registerNib:[UINib nibWithNibName:@"PokemonTableViewCell" bundle:nil] forCellReuseIdentifier:kCellId];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor clearColor];
    self.searchBar.delegate = self;
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    self.pokemonList = [[NSMutableArray alloc] init];
    LoadingViewController *loadingView = [[LoadingViewController alloc] init];
    [self presentViewController:loadingView animated:NO completion:nil];
    // Appel de la methode static pour récupèrer les données
    [self loadPokemonInTableViewWithLoadingView:loadingView];
}

- (void)refreshTable {
    // On refresh soit les résultat de la recherche (si la searchbar
    // n'est pas vide, soit tous les pokemon dans la TableView
    if([self.searchBar.text isEqualToString:@""]){
        [self loadPokemonInTableViewWithLoadingView:nil];
    } else{
        [self loadPokemonSearchResultIntTableView];
    }
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableViewMessage setHidden:YES];
    // Changement de couleur de la barre de navigation
    self.navigationController.navigationBar.barTintColor = [Tools UIColorFromRGB:0xB71C1C];
    // Changement de couleur de la police de la barre de navigation
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    if (indexPath) {
        // Deselectionne l'elemen de la tableview
        [self.tableView deselectRowAtIndexPath:indexPath animated:animated];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) btnAbout_Click:(id) sender{
    AboutViewController* aboutView = [[AboutViewController alloc] init];
    [self presentViewController:aboutView animated:YES completion:nil];
}

- (void) btnPokePosition_Click:(id) sender{
    PokemonPositionViewController *view = [[PokemonPositionViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([self.pokemonList count] == 0){
        self.tableViewMessage.text = [StringRessources getEmptyResultMessage:[Tools getLocaleLanguage]];
        [self.tableViewMessage setHidden:NO];
    } else {
        self.tableViewMessage.text = @"";
        [self.tableViewMessage setHidden:YES];
    }
    return [self.pokemonList count];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger pokeId = [[self.pokemonList objectAtIndex:indexPath.row].number integerValue];
    PokemonFamilyViewController *pokemonFamilyView  = [[PokemonFamilyViewController alloc] initWithNibName:@"PokemonFamilyViewController" bundle:nil pokemonId:(pokeId)];
    [self.navigationController pushViewController:pokemonFamilyView animated:YES];
}

/// Recharge la table view
- (void) reloadTableView{
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self loadPokemonSearchResultIntTableView];
    [self.tableView reloadData];
    [searchBar resignFirstResponder];
}

- (bool)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [self.searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

-(bool)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    [self.searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(![self.searchBar.text isEqualToString:@""]){
        [self loadPokemonSearchResultIntTableView];
        [self.tableView reloadData];
    }else{
        [self loadPokemonInTableViewWithLoadingView:[[LoadingViewController alloc] init]];
    }
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    searchBar.text = @"";
    [self loadPokemonInTableViewWithLoadingView:[[LoadingViewController alloc] init]];
}

/// Verifie l'existance d'une connection internet
/// et charge les éléments dans la tableview
- (void) loadPokemonInTableViewWithLoadingView:(LoadingViewController*) loadingView{
    if([Tools isInternetConnected]){
        [self.pokemonList removeAllObjects];
        self.pokemonList = [PokeDataLayer getAllPokemonsWithRootView:self andLoadingView:loadingView];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Information" message:[StringRessources getNoInternetConnectionMessageWithLocaleString:[Tools getLocaleLanguage]] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * refreshAction = [UIAlertAction actionWithTitle:[StringRessources getTryAgainMessage:[Tools getLocaleLanguage]] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [self loadPokemonInTableViewWithLoadingView:loadingView];
        }];
        [alertController addAction:refreshAction];
        if(!loadingView){
            [loadingView presentViewController:alertController animated: YES completion: nil];
        }
    }
}

/// Verifie l'existance d'une connection internet
/// et charge les éléments résultant d'une recherche
/// dans la tableview
- (void) loadPokemonSearchResultIntTableView{
    if([Tools isInternetConnected]){
        [self.pokemonList removeAllObjects];
        self.pokemonList = [PokeDataLayer getAllPokemonsWithRootView:self andSearchPattern:self.searchBar.text];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Information" message:[StringRessources getNoInternetConnectionMessageWithLocaleString:[Tools getLocaleLanguage]] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * refreshAction = [UIAlertAction actionWithTitle:[StringRessources getTryAgainMessage:[Tools getLocaleLanguage]] style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [self loadPokemonSearchResultIntTableView];
        }];
        [alertController addAction:refreshAction];
        [self presentViewController:alertController animated: YES completion: nil];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PokemonTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    if(!cell){
        /// Chargement du xib de la cellule custom dans la tableView
        [tableView registerNib:[UINib nibWithNibName:@"PokemonTableViewCell" bundle:nil] forCellReuseIdentifier:kCellId];
        cell = [tableView dequeueReusableCellWithIdentifier:kCellId forIndexPath:indexPath];
    }
    Pokemon *currentPokemon = [self.pokemonList objectAtIndex:indexPath.row];
    
    [PokeDataLayer getPokemonSpriteWithId:(unsigned short)[currentPokemon.number intValue] andCell:cell];
    cell.pokemonName.text = currentPokemon.name;
    if([currentPokemon.types count] > 0){
        cell.pokemonType1.text = [currentPokemon.types objectAtIndex:0];
    }else{
        cell.pokemonType1.text = @"---";
    }
    
    if([currentPokemon.types count] > 1){
        cell.pokemonType2.text = [currentPokemon.types objectAtIndex:1];
    }else{
        cell.pokemonType2.text = @"---";
    }

    return cell;
}


@end
