//
//  PokeDataLayer.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootViewController.h"
#import "PokemonTableViewCell.h"
#import "Pokemon.h"

@interface PokeDataLayer : NSObject

/// Récupère tous les Pokemon depuis le webservice
+ (NSMutableArray<Pokemon*>*) getAllPokemonsWithRootView:(RootViewController*) view;

/// Récupère un Pokemon depuis le webservice avec son id
+ (Pokemon*) getPokemonWithId:(unsigned short) pokemonId;

/// Récupère tous les types existant de pokemon
+ (NSMutableArray<NSString*>*) getAllPokemonTypes;

/// Récupère le sprite du pokemon depuis le serveur avec son id
+ (void) getPokemonSpriteWithId:(unsigned short) pokemonId andCell:(PokemonTableViewCell*) cell;

/// Récupère l'image du pokemon depuis le serveur avec son id
+ (void) getPokemonImageWithId:(unsigned short) pokemonId andImageView:(UIImageView*) imageView;

@end
