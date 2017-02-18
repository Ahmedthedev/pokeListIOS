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
    else if([locale isEqualToString:@"fr-FR"]){
        return @"Votre téléphone a besoins d'être connecté pour utiliser cette application.\n Veuillez vérifier votre connexion et réessayez ultérieur.";
    }
    return nil;
}

+ (NSString*) getTryAgainMessage:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Try again";
    }
    else if([locale isEqualToString:@"fr-FR"]){
        return @"Réessayer";
    }
    return nil;
}

+ (NSString*) getLoadingMessage:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Loading";
    }
    else if([locale isEqualToString:@"fr-FR"]){
        return @"Chargement";
    }
    return nil;
}

+ (NSString*) getWeightLabel:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Weight";
    }
    else if([locale isEqualToString:@"fr-FR"]){
        return @"Poids";
    }
    return nil;
}

+ (NSString*) getHeightLabel:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Height";
    }
    else if([locale isEqualToString:@"fr-FR"]){
        return @"Taille";
    }
    return nil;
}

@end
