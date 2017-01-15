//
//  NextEvolutionRequirements.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NextEvolutionRequirements : NSObject{
    @private
    int amount_;
    NSString *name_;
}

@property(nonatomic, assign) int amount;
@property(nonatomic, strong) NSString *name;

@end
