//
//  Pokemon.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FastAttack.h"
#import "SpecialAttack.h"
#import "Weight.h"
#import "Height.h"
#import "NextEvolutionRequirements.h"
#import "NextEvolution.h"
#import "PreviousEvolution.h"

@interface Pokemon : NSObject{
    @private
    NSString *number_;
    NSString *name_;
    NSString *classification_;
    NSMutableArray<NSString*> *types_;
    NSMutableArray<NSString*> *resistant_;
    NSMutableArray<NSString*> *weaknesses_;
    NSMutableArray<FastAttack*> *fastAttacks_;
    NSMutableArray<SpecialAttack*> *specialAttacks_;
    Weight *weight_;
    Height *height_;
    double fleeRate_;
    NextEvolutionRequirements *nextEvolutionRequirements_;
    NSMutableArray<NextEvolution*> *nextEvolutions_;
    NSMutableArray<PreviousEvolution*> *previousEvolutions_;
    int maxCP_;
    int maxHP_;
}

@property(nonatomic, strong) NSString *number;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *classification;
@property(nonatomic, strong) NSMutableArray<NSString*> *types;
@property(nonatomic, strong) NSMutableArray<NSString*> *resistant;
@property(nonatomic, strong) NSMutableArray<NSString*> *weaknesses;
@property(nonatomic, strong) NSMutableArray<FastAttack*> *fastAttacks;
@property(nonatomic, strong) NSMutableArray<SpecialAttack*> *specialAttacks;
@property(nonatomic, strong) Weight *weight;
@property(nonatomic, strong) Height *height;
@property(nonatomic, assign) double fleeRate;
@property(nonatomic, strong) NextEvolutionRequirements *nextEvolutionRequirements;
@property(nonatomic, strong) NSMutableArray<NextEvolution*> *nextEvolutions;
@property(nonatomic, strong) NSMutableArray<PreviousEvolution*> *previousEvolutions;
@property(nonatomic, assign) int maxCP;
@property(nonatomic, assign) int maxHP;

/// Constructeur prenant en paramètre, un dictionnaire
- (instancetype) initWithNSDictionnary:(NSDictionary*)dict;

@end
