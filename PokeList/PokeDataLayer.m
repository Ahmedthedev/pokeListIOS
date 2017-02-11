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
#import "PokemonFamilyViewController.h"

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

+ (NSMutableArray<NSNumber*>*) getPokemonFamilyWithPokemonFamilyView:(PokemonFamilyViewController*) view {
    __block NSMutableArray<NSNumber*> *pokemonIds = [[NSMutableArray alloc] init];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%hu", baseApiUrl, @"/pokemonFamily/ids/", view.currentPokemonId]]];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error){
            NSError* jsonError = nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            for (id key in dict) {
                [pokemonIds addObject:key];
            }
        }
        // On quitte le mode asynchrone pour impacter la vue
        dispatch_async(dispatch_get_main_queue(), ^{
            [view.mainScrollView setContentSize:CGSizeMake(view.view.frame.size.width * [pokemonIds count], 0)];
            int count = 0;
            for(NSNumber* pokeId in pokemonIds){
                FeaturesViewController* featureView = [[FeaturesViewController alloc] initWithNibName:@"FeaturesViewController" bundle:nil pokemonId:[pokeId shortValue]];
                CGRect frame = view.view.frame;
                frame.origin.x = view.view.frame.size.width * count;
                featureView.view.frame = frame;
                [view.featuresViews addObject:featureView.view];
                if(view.currentPokemonId == [pokeId shortValue]){
                    [view.mainScrollView setContentOffset:CGPointMake(view.view.frame.size.width * count, 0) animated:NO];
                }
                count++;
                [view addSubViewWithView:featureView.view];
            }
        });
    }];
    [dataTask resume];
    return pokemonIds;
}

+ (NSMutableArray<Pokemon*>*) getAllPokemonsWithRootView:(RootViewController*) view andSearchPattern:(NSString*) pattern{
    __block NSMutableArray<Pokemon*> *pokemonsList = [[NSMutableArray alloc] init];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", baseApiUrl, @"/pokemon/search/", pattern]]];
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
                featureView.name.text = pokemon.name;
                featureView.title = pokemon.name;
                featureView.weight.text = pokemon.weight.minimum;
                if([pokemon.types count] > 0){
                    featureView.firstType.text = [pokemon.types objectAtIndex:0];
                    featureView.backgroundImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"BG%@.png", [pokemon.types objectAtIndex:0]]];
                }else{
                    featureView.backgroundImage.image = [[UIImage alloc] init];
                    featureView.firstType.text = @"---";
                }
                if([pokemon.types count] > 1){
                    featureView.secondType.text = [pokemon.types objectAtIndex:1];
                }else{
                    featureView.secondType.text = @"---";
                }
                featureView.pokeDescription.text = pokemon.classification;
                featureView.height.text = pokemon.height.maximum;
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
