//
//  PokemonFamilyViewController.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 05/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FeaturesViewController;
@class Pokemon;

@interface PokemonFamilyViewController : UIViewController{
    NSMutableArray<FeaturesViewController*> *featuresViews_;
    unsigned short currentPokemonId_;
}
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (retain, nonatomic) NSMutableArray<FeaturesViewController*> *featuresViews;

@property (assign, nonatomic) unsigned short currentPokemonId;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pokemonId:(unsigned short) pokeId;

/// Charge les données avec l'id du pokemon
- (void) loadPokemonFamilyData;

/// Ajout de sous vue dans la scrollView
- (void) addSubViewWithView:(UIView*) view;

/// Fonction partage de pokemon
- (void) sharePokemon:(Pokemon*) pokemon;

@end
