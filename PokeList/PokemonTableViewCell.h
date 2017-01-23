//
//  PokemonTableViewCell.h
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 23/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PokemonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *pokemonSprite;
@property (weak, nonatomic) IBOutlet UILabel *pokemonName;
@property (weak, nonatomic) IBOutlet UILabel *pokemonType1;
@property (weak, nonatomic) IBOutlet UILabel *pokemonType2;

@end
