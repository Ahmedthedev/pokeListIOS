//
//  NextEvolution.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "NextEvolution.h"

@implementation NextEvolution

@synthesize number = number_;
@synthesize name = name_;

- (instancetype) initWithNSDictionnary:(NSDictionary*) dict{
    self = [super init];
    if(!self){
        self.number = (int)[dict objectForKey:@"Number"];
        self.name = (NSString*)[dict objectForKey:@"Name"];
    }
    return self;
}

@end
