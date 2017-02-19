//
//  StringRessources.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 18/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "StringRessources.h"

/// Cette classe permet de récupere les message ou des mots
/// traduit en fonction de la langue passer en paramètre
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

/// Retourne le string, Aucun resultat
/// en fonction de la langue passer en paramètre
+ (NSString*) getEmptyResultMessage:(NSString*) locale{
    if([locale isEqualToString:@"en"]){
        return @"Empty result";
    }
    else if([locale isEqualToString:@"fr"]){
        return @"Aucun résultat";
    }
    return @"Empty result";
}

/// Retourne le type anglais correspondant au type
/// passer en paramètre
+ (NSString*) getEnTypesForString:(NSString*) typeStr{
    if([typeStr isEqualToString:@"Bug"] || [typeStr isEqualToString:@"Insect"]){
        return @"Bug";
    } else if([typeStr isEqualToString:@"Dragon"]){
        return @"Dragon";
    } else if([typeStr isEqualToString:@"Electric"] || [typeStr isEqualToString:@"Electr"]){
        return @"Electric";
    } else if([typeStr isEqualToString:@"Fairy"] || [typeStr isEqualToString:@"Fee"]){
        return @"Fairy";
    } else if([typeStr isEqualToString:@"Fighting"] || [typeStr isEqualToString:@"Combat"]){
        return @"Fighting";
    } else if([typeStr isEqualToString:@"Fire"] || [typeStr isEqualToString:@"Feu"]){
        return @"Fire";
    } else if([typeStr isEqualToString:@"Fly"] || [typeStr isEqualToString:@"Vol"]){
        return @"Fly";
    } else if([typeStr isEqualToString:@"Ghost"] || [typeStr isEqualToString:@"Spectr"]){
        return @"Ghost";
    } else if([typeStr isEqualToString:@"Grass"] || [typeStr isEqualToString:@"Plante"]){
        return @"Grass";
    } else if([typeStr isEqualToString:@"Ground"] || [typeStr isEqualToString:@"Sol"]){
        return @"Ground";
    } else if([typeStr isEqualToString:@"Ice"] || [typeStr isEqualToString:@"Glace"]){
        return @"Ice";
    } else if([typeStr isEqualToString:@"Normal"]){
        return @"Normal";
    } else if([typeStr isEqualToString:@"Poison"]){
        return @"Poison";
    } else if([typeStr isEqualToString:@"Psychic"] || [typeStr isEqualToString:@"Psy"]){
        return @"Psychic";
    } else if([typeStr isEqualToString:@"Rock"] || [typeStr isEqualToString:@"Roche"]){
        return @"Rock";
    } else if([typeStr isEqualToString:@"Water"] || [typeStr isEqualToString:@"Eau"]){
        return @"Water";
    }
    return @"";
}

@end
