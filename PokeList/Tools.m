//
//  Tools.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 23/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "Tools.h"
#import "Reachability.h"
#import <QuartzCore/QuartzCore.h>
#import "AboutViewController.h"

/// Cette classe contient des fonction annexe utiles
@implementation Tools

/// Convertion du format HEX (0xFFFFFF) en UIColor
+ (UIColor*) UIColorFromRGB:(unsigned) hexValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
                           green:((float)((hexValue & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((hexValue & 0x0000FF) >>  0))/255.0 \
                           alpha:1.0];
}

/// Retourne YES si l'iphone est connecté a internet
+ (bool) isInternetConnected{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        return NO;
    }
    return YES;
}


/// Retourne une capture d'ecran pour la fonction share
+ (UIImage*) getUIImageWithView:(UIView*) view{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

/// Retourne la langue courrante du téléphone
+ (NSString*) getLocaleLanguage{
    return [[[NSLocale preferredLanguages] objectAtIndex:0] substringToIndex:2];
}

@end
