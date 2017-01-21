//
//  SpecialAttack.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "SpecialAttack.h"

@implementation SpecialAttack

@synthesize name = name_;
@synthesize type = type_;
@synthesize damage = damage_;

- (instancetype) initWithNSDictionnary:(NSDictionary*) dict{
    self = [super init];
    if(!self){
        self.name = (NSString*)[dict objectForKey:@"Name"];
        self.type = (NSString*)[dict objectForKey:@"Type"];
        self.damage = (int)[dict objectForKey:@"Damage"];
    }
    return self;
}

@end
