//
//  PokemonPositionViewController.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 19/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;

@interface PokemonPositionViewController : UIViewController{
    GMSMapView *mapView_;
}

@property (strong, nonatomic) GMSMapView *mapView;

@end
