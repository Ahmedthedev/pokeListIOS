//
//  PokemonPosition.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 19/02/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "PokemonPosition.h"

@implementation PokemonPosition

@synthesize number = number_;
@synthesize latitude = latitude_;
@synthesize longitude = longitude_;

/// Constructeur prenant en paramètre, un dictionnaire
- (instancetype) initWithNSDictionnary:(NSDictionary*) dict{
    self = [super init];
    if(self){
        if(![dict isEqual:[NSNull null]]){
            self.number = (int)[dict objectForKey:@"number"];
            self.latitude = [(NSString *)[dict objectForKey:@"latitude"] doubleValue];
            self.longitude = [(NSString *)[dict objectForKey:@"longitude"] doubleValue];
        }
    }
    return self;
}

@end
