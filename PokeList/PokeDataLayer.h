//
//  PokeDataLayer.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootViewController.h"
#import "Pokemon.h"

@interface PokeDataLayer : NSObject

/// Récupère tous les Pokemon depuis le webservice
+ (NSMutableArray<Pokemon*>*) getAllPokemonsWithRootView:(RootViewController*) view;

/// Récupère un Pokemon depuis le webservice avec son id
+ (Pokemon*) getPokemonWithId:(unsigned short) pokemonId;

/// Récupère tous les types existant de pokemon
+ (NSMutableArray<NSString*>*) getAllPokemonTypes;

@end
