//
//  PokemonPosition.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 19/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PokemonPosition : NSObject{
    @private
    int number_;
    double latitude_;
    double longitude_;
}

@property (nonatomic, assign) int number;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

- (instancetype) initWithNSDictionnary:(NSDictionary*) dict;

@end
