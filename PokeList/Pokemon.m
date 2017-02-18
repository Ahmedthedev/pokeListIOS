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

/// Constructeur prenant en paramètre, un dictionnaire
- (instancetype) initWithNSDictionnary:(NSDictionary*)dict{
    self = [super init];
    if(self){
        NSDictionary *tmp;
        self.types = [[NSMutableArray alloc] init];
        self.resistant = [[NSMutableArray alloc] init];
        self.weaknesses = [[NSMutableArray alloc] init];
        self.fastAttacks = [[NSMutableArray alloc] init];
        self.specialAttacks = [[NSMutableArray alloc] init];
        self.nextEvolutions = [[NSMutableArray alloc] init];
        self.previousEvolutions = [[NSMutableArray alloc] init];
        
        self.number = (NSString*)[dict objectForKey:@"number"];
        self.name = (NSString*)[dict objectForKey:@"name"];
        self.classification = (NSString*)[dict objectForKey:@"classification"];
        tmp = [dict objectForKey:@"types"];
        if(![tmp isEqual:[NSNull null]]){
            for (id key in tmp) {
                [self.types addObject:key];
            }
        }
        tmp = [dict objectForKey:@"resistant"];
        if(![tmp isEqual:[NSNull null]]){
            for (id key in tmp) {
                [self.resistant addObject:key];
            }
        }
        tmp = [dict objectForKey:@"weaknesses"];
        if(![tmp isEqual:[NSNull null]]){
            for (id key in tmp) {
                [self.weaknesses addObject:key];
            }
        }
        tmp = [dict objectForKey:@"fastAttacks"];
        if(![tmp isEqual:[NSNull null]]){
            for (id key in tmp) {
                [self.fastAttacks addObject:[[FastAttack alloc] initWithNSDictionnary:key]];
            }
        }
        tmp = [dict objectForKey:@"specialAttacks"];
        if(![tmp isEqual:[NSNull null]]){
            for (id key in tmp) {
                [self.specialAttacks addObject:[[SpecialAttack alloc] initWithNSDictionnary:key]];
            }
        }
        self.weight = [[Weight alloc] initWithNSDictionnary:[dict objectForKey:@"weight"]];
        self.height = [[Height alloc] initWithNSDictionnary:[dict objectForKey:@"height"]];
        self.fleeRate = [[dict objectForKey:@"fleeRate"] doubleValue];
        self.nextEvolutionRequirements = [[NextEvolutionRequirements alloc] initWithNSDictionnary:[dict objectForKey:@"nextEvolutionRequirements"]];
        tmp = [dict objectForKey:@"nextEvolutions"];
        if(![tmp isEqual:[NSNull null]]){
            for (id key in tmp) {
                [self.nextEvolutions addObject:[[NextEvolution alloc] initWithNSDictionnary:key]];
            }
        }
        tmp = [dict objectForKey:@"previousEvolutions"];
        if(![tmp isEqual:[NSNull null]]){
            for (id key in tmp) {
                [self.previousEvolutions addObject:[[PreviousEvolution alloc] initWithNSDictionnary:key]];
            }
        }
        self.maxCP = [[dict objectForKey:@"maxCP"] intValue];
        self.maxHP = [[dict objectForKey:@"maxHP"] intValue];
    }
    return self;
}

@end
