//
//  Height.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "Height.h"

@implementation Height

@synthesize minimum = minimum_;
@synthesize maximum = maximum_;

- (instancetype) initWithNSDictionnary:(NSDictionary*) dict{
    self = [super init];
    if(!self){
        self.minimum = (NSString*)[dict objectForKey:@"Minimum"];
        self.maximum = (NSString*)[dict objectForKey:@"Maximum"];
    }
    return self;
}

@end
