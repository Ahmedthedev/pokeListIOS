//
//  PokemonPositionViewController.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 19/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//
#define ARC4RANDOM_MAX 0x100000000
#import "PokemonPositionViewController.h"
#import "PokeDataLayer.h"

@interface PokemonPositionViewController ()

@end

@implementation PokemonPositionViewController

@synthesize mapView = mapView_;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Map";
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    
    const double esgiLatitude = 48.8491666;
    const double esgiLongitude = 2.3897343;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:esgiLatitude
                                                            longitude:esgiLongitude
                                                                 zoom:13];
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView.myLocationEnabled = YES;
    self.view = self.mapView;
    
    const double maxLatitude = 48.879726;
    const double latitude = 48.8091666;
    const double maxLongitude = 2.389735;
    const double longitude  = 2.3507643;
    
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(esgiLatitude,esgiLongitude);
    GMSMarker *school = [GMSMarker markerWithPosition:position];
    school.title = @"ESGI";
    school.map = self.mapView;
    
    NSMutableArray *rsg = [[NSMutableArray alloc]init];
    for( int i = 0; i < 9; ++i )
    {
        double latitudeVal = ((double)arc4random() / ARC4RANDOM_MAX) * (maxLatitude - latitude) + latitude;
        double longitudeVal = ((double)arc4random() / ARC4RANDOM_MAX) * (maxLongitude - longitude) + longitude;
        [rsg addObject:[NSNumber numberWithDouble:latitudeVal]];
        [rsg addObject:[NSNumber numberWithDouble:longitudeVal]];
    }
    for(int i = 0; i < [rsg count]; i+=2)
    {
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake([[rsg objectAtIndex:i] doubleValue],[[rsg objectAtIndex:i+1] doubleValue]);
        GMSMarker *marker = [GMSMarker markerWithPosition:position];
        [PokeDataLayer getPokemonSpriteWithId:(arc4random() % 150)+1 andGMarker:marker];
        marker.map = self.mapView;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
