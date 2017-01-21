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

+ (NSMutableArray<Pokemon*>*) getAllPokemonsWithRootView:(RootViewController*) view;

@end
