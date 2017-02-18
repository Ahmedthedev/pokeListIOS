//
//  StringRessources.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 18/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringRessources : NSObject

/// Message d'erreur, problème de connexion
+ (NSString*) getNoInternetConnectionMessageWithLocaleString:(NSString*) locale;

+ (NSString*) getTryAgainMessage:(NSString*) locale;

+ (NSString*) getLoadingMessage:(NSString*) locale;

+ (NSString*) getWeightLabel:(NSString*) locale;

+ (NSString*) getHeightLabel:(NSString*) locale;

@end
