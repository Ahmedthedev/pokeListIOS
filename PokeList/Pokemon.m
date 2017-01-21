//
//  Pokemon.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

@synthesize number = number_;
@synthesize name = name_;
@synthesize classification = classification_;
@synthesize types = types_;
@synthesize resistant = resistant_;
@synthesize weaknesses = weaknesses_;
@synthesize fastAttacks = fastAttacks_;
@synthesize specialAttacks = specialAttacks_;
@synthesize weight = weight_;
@synthesize height = height_;
@synthesize fleeRate = fleeRate_;
@synthesize nextEvolutions = nextEvolutions_;
@synthesize nextEvolutionRequirements = nextEvolutionRequirements_;
@synthesize previousEvolutions = previousEvolutions_;
@synthesize maxHP = maxHP_;
@synthesize maxCP = maxCP_;

- (instancetype) initWithNSDictionnary:(NSDictionary*)dict{
    self = [super init];
    if(!self){
        NSDictionary *tmp;
        self.number = (NSString*)[dict objectForKey:@"Number"];
        self.name = (NSString*)[dict objectForKey:@"Name"];
        self.classification = (NSString*)[dict objectForKey:@"Classification"];
        tmp = [dict objectForKey:@"Types"];
        for (NSString* key in tmp) {
            [self.types addObject:[tmp objectForKey:key]];
        }
        tmp = [dict objectForKey:@"Resistant"];
        for (NSString* key in tmp) {
            [self.resistant addObject:[tmp objectForKey:key]];
        }
        tmp = [dict objectForKey:@"Weaknesses"];
        for (NSString* key in tmp) {
            [self.weaknesses addObject:[tmp objectForKey:key]];
        }
        tmp = [dict objectForKey:@"FastAttacks"];
        for (NSString* key in tmp) {
            [self.fastAttacks addObject:[[FastAttack alloc] initWithNSDictionnary:[tmp objectForKey:key]]];
        }
        tmp = [dict objectForKey:@"SpecialAttacks"];
        for (NSString* key in tmp) {
            [self.specialAttacks addObject:[[SpecialAttack alloc] initWithNSDictionnary:[tmp objectForKey:key]]];
        }
        self.weight = [[Weight alloc] initWithNSDictionnary:[dict objectForKey:@"Weight"]];
        self.height = [[Height alloc] initWithNSDictionnary:[dict objectForKey:@"Height"]];
        self.fleeRate = [[dict objectForKey:@"FleeRate"] doubleValue];
        self.nextEvolutionRequirements = [[NextEvolutionRequirements alloc] initWithNSDictionnary:[dict objectForKey:@"NextEvolutionRequirements"]];
        tmp = [dict objectForKey:@"NextEvolutions"];
        for (NSString* key in tmp) {
            [self.nextEvolutions addObject:[[NextEvolution alloc] initWithNSDictionnary:[tmp objectForKey:key]]];
        }
        tmp = [dict objectForKey:@"PreviousEvolutions"];
        for (NSString* key in tmp) {
            [self.previousEvolutions addObject:[[PreviousEvolution alloc] initWithNSDictionnary:[tmp objectForKey:key]]];
        }
        self.maxCP = [[dict objectForKey:@"MaxCP"] intValue];
        self.maxHP = [[dict objectForKey:@"MaxHP"] intValue];
    }
    return self;
}

@end
