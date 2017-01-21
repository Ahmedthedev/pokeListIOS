//
//  Weight.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "Weight.h"

@implementation Weight

@synthesize minimum = minimum_;
@synthesize maximum = maximum_;

- (instancetype) initWithNSDictionnary:(NSDictionary*) dict{
    self = [super init];
    if(self){
        if(![dict isEqual:[NSNull null]]){
            self.minimum = (NSString*)[dict objectForKey:@"minimum"];
            self.maximum = (NSString*)[dict objectForKey:@"maximum"];
        }
    }
    return self;
}

@end
