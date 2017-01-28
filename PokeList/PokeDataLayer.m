//
//  PokeDataLayer.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "PokeDataLayer.h"
#import "FeaturesViewController.h"
#import "LoadingViewController.h"

@implementation PokeDataLayer

/// Url de base du webservice
const NSString *baseApiUrl = @"http://pokelist.azurewebsites.net/api";
const NSString *baseImageUrl = @"http://jeyaksan-rajaratnam.esy.es/webapp/pokelist/assets";

+ (NSMutableArray<Pokemon*>*) getAllPokemonsWithRootView:(RootViewController*) view andLoadingView:(LoadingViewController*) loadingView{
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
            [loadingView dismissViewControllerAnimated:YES completion:nil];
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
                featureView.name.text = pokemon.name;
                featureView.title = pokemon.name;
                featureView.weight.text = pokemon.weight.minimum;
                if([pokemon.types count] > 0){
                    featureView.firstType.text = [pokemon.types objectAtIndex:0];
                }else{
                    featureView.firstType.text = @"---";
                }
                if([pokemon.types count] > 1){
                    featureView.secondType.text = [pokemon.types objectAtIndex:1];
                }else{
                    featureView.secondType.text = @"---";
                }
                featureView.pokeDescription.text = pokemon.classification;
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
    
    NSString *spriteUrl = [NSString stringWithFormat:@"%@/sprites/%hu.png", baseImageUrl, pokemonId];
#ifndef NDEBUG
    /* Debug only code */ /* Code compilé uniquement en mode debug ! */
    NSLog(@"DEBUG --> Sprite URL --> %hu", pokemonId);
    NSLog(@"DEBUG --> Sprite URL --> %@", spriteUrl);
#endif
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:spriteUrl]];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error){
            
            // On quitte le mode asynchrone pour impacter la vue
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.pokemonSprite.image = [UIImage imageWithData:data];
            });
        }
    }];
    [dataTask resume];
}

+ (void) getPokemonImageWithId:(unsigned short) pokemonId andImageView:(UIImageView*) imageView{
    imageView.image = nil;
    NSString *imageUrl = [NSString stringWithFormat:@"%@/%hu.png", baseImageUrl, pokemonId];
#ifndef NDEBUG
    /* Debug only code */ /* Code compilé uniquement en mode debug ! */
    NSLog(@"DEBUG --> Image URL --> %hu", pokemonId);
    NSLog(@"DEBUG --> Image URL --> %@", imageUrl);
#endif
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:imageUrl]];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error){
            
            // On quitte le mode asynchrone pour impacter la vue
            dispatch_async(dispatch_get_main_queue(), ^{
                imageView.image = [UIImage imageWithData:data];
            });
        }
    }];
    [dataTask resume];
}

+ (NSMutableArray<NSString*>*) getPokemonNamesWithString:(NSString*) searchPattern{
    // NOT IMPLEMENTED -------
    return nil;
}

@end
