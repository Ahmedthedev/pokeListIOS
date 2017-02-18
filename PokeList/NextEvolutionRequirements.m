//
//  NextEvolutionRequirements.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "NextEvolutionRequirements.h"

@implementation NextEvolutionRequirements

@synthesize amount = amount_;
@synthesize name = name_;

/// Constructeur prenant en paramètre, un dictionnaire
- (instancetype) initWithNSDictionnary:(NSDictionary*) dict{
    self = [super init];
    if(self){
        if(![dict isEqual:[NSNull null]]){
            self.amount = (int)[dict objectForKey:@"amount"];
            self.name = (NSString*)[dict objectForKey:@"name"];
        }
    }
    return self;
}

@end
