//
//  Tools.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 23/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "Tools.h"
#import "Reachability.h"

@implementation Tools

+ (UIColor*) UIColorFromRGB:(unsigned) hexValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
                           green:((float)((hexValue & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((hexValue & 0x0000FF) >>  0))/255.0 \
                           alpha:1.0];
}

+ (bool) isInternetConnected{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        return NO;
    }
    return YES;
}

@end
