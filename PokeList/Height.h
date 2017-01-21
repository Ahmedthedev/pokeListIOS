//
//  Height.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 15/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Height : NSObject{
@private
    NSString *minimum_;
    NSString *maximum_;
}

@property(nonatomic, strong) NSString *minimum;
@property(nonatomic, strong) NSString *maximum;

/// Constructeur prenant en paramètre, un dictionnaire
- (instancetype) initWithNSDictionnary:(NSDictionary*) dict;

@end
