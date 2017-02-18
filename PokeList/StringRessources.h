//
//  StringRessources.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 18/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringRessources : NSObject

/// Retourne le Message d'erreur, problème de connexion
/// en fonction de la langue passer en paramètre
+ (NSString*) getNoInternetConnectionMessageWithLocaleString:(NSString*) locale;

/// Retourne le string, Réesayer
/// en fonction de la langue passer en paramètre
+ (NSString*) getTryAgainMessage:(NSString*) locale;

/// Retourne le string, Chargement
/// en fonction de la langue passer en paramètre
+ (NSString*) getLoadingMessage:(NSString*) locale;

/// Retourne le string, Poids
/// en fonction de la langue passer en paramètre
+ (NSString*) getWeightLabel:(NSString*) locale;

/// Retourne le string, Taille
/// en fonction de la langue passer en paramètre
+ (NSString*) getHeightLabel:(NSString*) locale;

@end
