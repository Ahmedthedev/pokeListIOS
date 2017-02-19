//
//  PokemonPositionViewController.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 19/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;
@import CoreLocation;
@class PokemonPosition;

@interface PokemonPositionViewController : UIViewController{
    @private
    GMSMapView *mapView_;
    int updateCount_;
}

@property (strong, nonatomic) GMSMapView *mapView;

@end
