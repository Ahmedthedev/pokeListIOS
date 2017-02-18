//
//  StringRessources.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 18/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "StringRessources.h"

@implementation StringRessources

/// Message d'erreur, problème de connexion
+ (NSString*) getNoInternetConnectionMessageWithLocaleString:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Your phone must be connected to internet to use this app.\n Please check your connection and try again.";
    }
    else if([locale isEqualToString:@"fr"]){
        return @"Votre téléphone a besoins d'être connecté pour utiliser cette application.\n Veuillez vérifier votre connexion et réessayez ultérieur.";
    }
    return @"Your phone must be connected to internet to use this app.\n Please check your connection and try again.";
}

+ (NSString*) getTryAgainMessage:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Try again";
    }
    else if([locale isEqualToString:@"fr"]){
        return @"Réessayer";
    }
    return @"Try again";;
}

+ (NSString*) getLoadingMessage:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Loading";
    }
    else if([locale isEqualToString:@"fr"]){
        return @"Chargement";
    }
    return @"Loading";
}

+ (NSString*) getWeightLabel:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Weight";
    }
    else if([locale isEqualToString:@"fr"]){
        return @"Poids";
    }
    return @"Weight";
}

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
