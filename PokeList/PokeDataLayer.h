//
//  PokeDataLayer.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "PokemonTableViewCell.h"
#import "Pokemon.h"
@class FeaturesViewController;
@class LoadingViewController;
@class PokemonFamilyViewController;

@interface PokeDataLayer : NSObject

/// Récupère tous les Pokemon depuis le webservice
+ (NSMutableArray<Pokemon*>*) getAllPokemonsWithRootView:(RootViewController*) view andLoadingView:(LoadingViewController*) loadingView;

/// Récupère les ids des evolution précédente et suivante
+ (NSMutableArray<NSNumber*>*) getPokemonFamilyWithPokemonFamilyView:(PokemonFamilyViewController*) view;

/// Récupère tous les Pokemon depuis le webservice avec
/// la chaine de caractère fournie en paramètre (recherche)
+ (NSMutableArray<Pokemon*>*) getAllPokemonsWithRootView:(RootViewController*) view  andSearchPattern:(NSString*) pattern;

/// Récupère un Pokemon depuis le webservice avec son id
+ (void) getPokemonWithId:(unsigned short) pokemonId andFeatureView:(FeaturesViewController*) featureView;

/// Récupère le sprite du pokemon depuis le serveur avec son id
+ (void) getPokemonSpriteWithId:(unsigned short) pokemonId andCell:(PokemonTableViewCell*) cell;

/// Récupère l'image du pokemon depuis le serveur avec son id
+ (void) getPokemonImageWithId:(unsigned short) pokemonId andImageView:(UIImageView*) imageView;

@end
