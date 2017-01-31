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
#import "Tools.h"
#import "Pokemon.h"
#import "PokeDataLayer.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@end

@implementation RootViewController

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
        self.navigationItem.rightBarButtonItem = btnAbout;
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
    self.searchBar.showsCancelButton = YES;
    self.pokemonList = [[NSMutableArray alloc] init];
    LoadingViewController *loadingView = [[LoadingViewController alloc] init];
    [self presentViewController:loadingView animated:NO completion:nil];
    // Appel de la methode static pour récupèrer les données
    [self loadPokemonInTableViewWithLoadingView:loadingView];
}

- (void) viewWillAppear:(BOOL)animated{
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
#ifndef NDEBUG
    /* Debug only code */ /* Code compilé uniquement en mode debug ! */
    NSLog(@"DEBUG --> About button was pressed");
#endif
    AboutViewController* aboutView = [[AboutViewController alloc] init];
    [self presentViewController:aboutView animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
#ifndef NDEBUG
    /* Debug only code */ /* Code compilé uniquement en mode debug ! */
    // %lu = unsigned long
    NSLog(@"DEBUG --> Pokemon count = %lu", (unsigned long)[self.pokemonList count]);
#endif
    return [self.pokemonList count];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger pokeId = [[self.pokemonList objectAtIndex:indexPath.row].number integerValue];
    FeaturesViewController * featureView  = [[FeaturesViewController alloc] initWithNibName:@"FeaturesViewController" bundle:nil pokemonId:pokeId];
    [self.navigationController pushViewController:featureView animated:YES];
}

- (void) reloadTableView{
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    self.pokemonList = [PokeDataLayer getAllPokemonsWithRootView:self andSearchPattern:searchBar.text];
    [self.tableView reloadData];
    [searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(![self.searchBar.text isEqualToString:@""]){
        self.pokemonList = [PokeDataLayer getAllPokemonsWithRootView:self andSearchPattern:searchBar.text];
        [self.tableView reloadData];
    }else{
        [self loadPokemonInTableViewWithLoadingView:[[LoadingViewController alloc] init]];
    }
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    [self loadPokemonInTableViewWithLoadingView:[[LoadingViewController alloc] init]];
}

- (void) loadPokemonInTableViewWithLoadingView:(LoadingViewController*) loadingView{
    if([Tools isInternetConnected]){
        [self.pokemonList removeAllObjects];
        self.pokemonList = [PokeDataLayer getAllPokemonsWithRootView:self andLoadingView:loadingView];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Information" message:@"Your phone must be connected to internet to use this app.\n Please check your connection and try again." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * refreshAction = [UIAlertAction actionWithTitle:@"Try again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [self loadPokemonInTableViewWithLoadingView:loadingView];
        }];
        [alertController addAction:refreshAction];
        [loadingView presentViewController:alertController animated: YES completion: nil];
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
    // cell.pokemonSprite.image = [UIImage imageNamed:@"Pokeball"];
    
    [PokeDataLayer getPokemonSpriteWithId:(unsigned short)[currentPokemon.number intValue] andCell:cell];
    cell.pokemonName.text = currentPokemon.name;
    // cell.pokemonType1.textColor = [UIColor whiteColor];
    // cell.pokemonType1.backgroundColor = [UIColor redColor];
    if([currentPokemon.types count] > 0){
        cell.pokemonType1.text = [currentPokemon.types objectAtIndex:0];
    }else{
        cell.pokemonType1.text = @"---";
    }
    
    // cell.pokemonType2.textColor = [UIColor whiteColor];
    // cell.pokemonType2.backgroundColor = [UIColor blueColor];
    if([currentPokemon.types count] > 1){
        cell.pokemonType2.text = [currentPokemon.types objectAtIndex:1];
    }else{
        cell.pokemonType2.text = @"---";
    }

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
