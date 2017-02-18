//
//  StringRessources.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 18/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "StringRessources.h"

@implementation StringRessources

/// Retourne le Message d'erreur, problème de connexion
/// en fonction de la langue passer en paramètre
+ (NSString*) getNoInternetConnectionMessageWithLocaleString:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Your phone must be connected to internet to use this app.\n Please check your connection and try again.";
    }
    else if([locale isEqualToString:@"fr"]){
        return @"Votre téléphone a besoins d'être connecté pour utiliser cette application.\n Veuillez vérifier votre connexion et réessayez ultérieur.";
    }
    return @"Your phone must be connected to internet to use this app.\n Please check your connection and try again.";
}

/// Retourne le string, Réesayer
/// en fonction de la langue passer en paramètre
+ (NSString*) getTryAgainMessage:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Try again";
    }
    else if([locale isEqualToString:@"fr"]){
        return @"Réessayer";
    }
    return @"Try again";;
}

/// Retourne le string, Chargement
/// en fonction de la langue passer en paramètre
+ (NSString*) getLoadingMessage:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Loading";
    }
    else if([locale isEqualToString:@"fr"]){
        return @"Chargement";
    }
    return @"Loading";
}

/// Retourne le string, Poids
/// en fonction de la langue passer en paramètre
+ (NSString*) getWeightLabel:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Weight";
    }
    else if([locale isEqualToString:@"fr"]){
        return @"Poids";
    }
    return @"Weight";
}

/// Retourne le string, Taille
/// en fonction de la langue passer en paramètre
+ (NSString*) getHeightLabel:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Height";
    }
    else if([locale isEqualToString:@"fr"]){
        return @"Taille";
    }
    return @"Height";
}

@end
