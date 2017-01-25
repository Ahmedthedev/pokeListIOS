//
//  FeaturesViewController.h
//  PokeList
//
//  Created by apple on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"
#import "PokeDataLayer.h"

@interface FeaturesViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIScrollView *featureScrollView;
@property (retain, nonatomic) IBOutlet UIView *featureView;
@property (retain, nonatomic) Pokemon* pokemon;

@property (weak, nonatomic) IBOutlet UILabel *firstType;
@property (weak, nonatomic) IBOutlet UILabel *secondType;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weight;

@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@property (weak, nonatomic) IBOutlet UILabel *height;
@property (weak, nonatomic) IBOutlet UILabel *description;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *name;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pokemonId:(unsigned short)pokeId;



@end
