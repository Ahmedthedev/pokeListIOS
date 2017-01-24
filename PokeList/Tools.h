//
//  Tools.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 23/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tools : NSObject

/// Convertis le format HEX (0xFFFFFF) en UIColor
+ (UIColor*) UIColorFromRGB:(unsigned) hexValue;

@end
