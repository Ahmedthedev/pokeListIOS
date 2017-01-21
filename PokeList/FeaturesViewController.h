//
//  FeaturesViewController.h
//  PokeList
//
//  Created by apple on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeaturesViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIScrollView *featureScrollView;
@property (retain, nonatomic) IBOutlet UIView *featureView;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pokemonId:(unsigned short)pokeId;

@end
