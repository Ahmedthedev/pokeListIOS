//
//  FastAttack.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "FastAttack.h"

@implementation FastAttack

@synthesize name = name_;
@synthesize type = type_;
@synthesize damage = damage_;

/// Constructeur prenant en paramètre, un dictionnaire
- (instancetype) initWithNSDictionnary:(NSDictionary*) dict{
    self = [super init];
    if(self){
        if(![dict isEqual:[NSNull null]]){
            self.name = (NSString*)[dict objectForKey:@"name"];
            self.type = (NSString*)[dict objectForKey:@"type"];
            self.damage = (int)[dict objectForKey:@"damage"];
        }
    }
    return self;
}

@end
