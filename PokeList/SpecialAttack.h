//
//  SpecialAttack.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialAttack : NSObject{
@private
    NSString *name_;
    NSString *type_;
    int damage_;
}

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *type;
@property(nonatomic, assign) int damage;

/// Constructeur prenant en paramètre, un dictionnaire
- (instancetype) initWithNSDictionnary:(NSDictionary*) dict;

@end
