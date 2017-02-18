//
//  Tools.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 23/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>

/// Cette classe contient des fonction annexe utiles
@interface Tools : NSObject

/// Convertion du format HEX (0xFFFFFF) en UIColor
+ (UIColor*) UIColorFromRGB:(unsigned) hexValue;

/// Retourne YES si l'iphone est connecté a internet
+ (bool) isInternetConnected;

/// Retourne une capture d'ecran pour la fonction share
+ (UIImage*) getUIImageWithView:(UIView*) view;

/// Retourne la langue courrante du téléphone
+ (NSString*) getLocaleLanguage;

@end
