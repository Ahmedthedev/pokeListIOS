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

- (instancetype) initWithNSDictionnary:(NSDictionary*) dict{
    self = [super init];
    if(!self){
        self.amount = (int)[dict objectForKey:@"Amount"];
        self.name = (NSString*)[dict objectForKey:@"Name"];
    }
    return self;
}

@end
