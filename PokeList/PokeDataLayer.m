//
//  PokeDataLayer.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "PokeDataLayer.h"
#import "FeaturesViewController.h"

@implementation PokeDataLayer

/// Url de base du webservice
const NSString *baseApiUrl = @"http://pokelist.azurewebsites.net/api";
const NSString *baseImageUrl = @"http://jeyaksan-rajaratnam.esy.es/webapp/pokelist/assets";

+ (NSMutableArray<Pokemon*>*) getAllPokemonsWithRootView:(RootViewController*) view {
    __block NSMutableArray<Pokemon*> *pokemonsList = [[NSMutableArray alloc] init];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", baseApiUrl, @"/pokemon" ]]];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error){
            NSError* jsonError = nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            for (id key in dict) {
                [pokemonsList addObject:[[Pokemon alloc] initWithNSDictionnary:key]];
            }
        }
        // On quitte le mode asynchrone pour impacter la vue
        dispatch_async(dispatch_get_main_queue(), ^{
            [view reloadTableView];
        });
    }];
    [dataTask resume];
    return pokemonsList;
}

+ (Pokemon*) getPokemonWithId:(unsigned short) pokemonId{
    __block Pokemon *pokemon = nil;
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%hu", baseApiUrl, @"/pokemon/", pokemonId]]];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error){
            NSError* jsonError = nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            pokemon = [[Pokemon alloc] initWithNSDictionnary:dict];
        }
    }];
    [dataTask resume];
    return pokemon;
}

+ (void) getPokemonWithId:(unsigned short) pokemonId andFeatureView:(FeaturesViewController*) featureView {
    __block Pokemon *pokemon = nil;
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%hu", baseApiUrl, @"/pokemon/", pokemonId]]];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error){
            NSError* jsonError = nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            pokemon = [[Pokemon alloc] initWithNSDictionnary:dict];
            [PokeDataLayer getPokemonImageWithId:pokemonId andImageView:featureView.pokemonImage];
            // On quitte le mode asynchrone pour impacter la vue
            dispatch_async(dispatch_get_main_queue(), ^{
                featureView.firstType.text = [pokemon.types objectAtIndex:0];
                featureView.secondType.text = [pokemon.types objectAtIndex:1];
                featureView.weight.text = pokemon.weight.minimum;
                featureView.name.text = pokemon.name;
            });
        }
    }];
    [dataTask resume];
}

+ (NSMutableArray<NSString*>*) getAllPokemonTypes{
    // NOT IMPLEMENTED -----
    return nil;
}

+ (void) getPokemonSpriteWithId:(unsigned short) pokemonId andCell:(PokemonTableViewCell*) cell{
    cell.pokemonSprite.image = [UIImage imageNamed:@"Pokeball"];
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        // %hu unsigned short
        NSString *spriteUrl = [NSString stringWithFormat:@"%@/sprites/%hu.png", baseImageUrl, pokemonId];
#ifndef NDEBUG
        /* Debug only code */ /* Code compilé uniquement en mode debug ! */
        NSLog(@"DEBUG --> Sprite URL --> %hu", pokemonId);
        NSLog(@"DEBUG --> Sprite URL --> %@", spriteUrl);
#endif
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: spriteUrl]];
        if (data != nil){
            dispatch_async(dispatch_get_main_queue(), ^{
                // Image récuperer du serveur
                cell.pokemonSprite.image = [UIImage imageWithData: data];
            });
        }
    });
}

+ (void) getPokemonImageWithId:(unsigned short) pokemonId andImageView:(UIImageView*) imageView{
    imageView.image = nil;
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        // %hu unsigned short
        NSString *imageUrl = [NSString stringWithFormat:@"%@/%hu.png", baseImageUrl, pokemonId];
#ifndef NDEBUG
        /* Debug only code */ /* Code compilé uniquement en mode debug ! */
        NSLog(@"DEBUG --> Image URL --> %hu", pokemonId);
        NSLog(@"DEBUG --> Image URL --> %@", imageUrl);
#endif
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageUrl]];
        if (data == nil){
            dispatch_async(dispatch_get_main_queue(), ^{
                // Image par defaut si image non télécharger (inexistant sur le serveur)
                imageView.image = [UIImage imageNamed:@"LaunchScreenIcon"];
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                // Image récuperer du serveur
                imageView.image = [UIImage imageWithData: data];
            });
        }
    });
}

+ (NSMutableArray<NSString*>*) getPokemonNamesWithString:(NSString*) searchPattern{
    // NOT IMPLEMENTED -------
    return nil;
}

@end
