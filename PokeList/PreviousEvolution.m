//
//  PreviousEvolution.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "PreviousEvolution.h"

@implementation PreviousEvolution

@synthesize number = number_;
@synthesize name = name_;

- (instancetype) initWithNSDictionnary:(NSDictionary*) dict{
    self = [super init];
    if(self){
        if(![dict isEqual:[NSNull null]]){
            self.number = (int)[dict objectForKey:@"number"];
            self.name = (NSString*)[dict objectForKey:@"name"];
        }
    }
    return self;
}

@end
