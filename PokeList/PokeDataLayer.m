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
#import "PokemonPositionViewController.h"
#import "PokemonPosition.h"
#import "StringRessources.h"

/// Cette classe permet de récupèrer les infos depuis le WebService
@implementation PokeDataLayer

/// Url de base du webservice
const NSString *baseApiUrl = @"http://pokelist.azurewebsites.net/api";
const NSString *baseImageUrl = @"http://jeyaksan-rajaratnam.esy.es/webapp/pokelist/assets";

/// Récupère tous les Pokemon depuis le webservice
+ (NSMutableArray<Pokemon*>*) getAllPokemonsWithRootView:(RootViewController*) view andLoadingView:(LoadingViewController*) loadingView{
    __block NSMutableArray<Pokemon*> *pokemonsList = [[NSMutableArray alloc] init];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", baseApiUrl, @"/pokemon", [[Tools getLocaleLanguage] capitalizedString]]]];
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

/// Récupère les ids des evolution précédente et suivante
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
        [view.mainScrollView setContentSize:CGSizeMake(view.view.frame.size.width * [pokemonIds count], 0)];
        int count = 0;
        for(NSNumber* pokeId in pokemonIds){
            FeaturesViewController* featureView = [[FeaturesViewController alloc] initWithNibName:@"FeaturesViewController" bundle:nil pokemonId:[pokeId shortValue]];
            CGRect frame = view.view.frame;
            frame.origin.x = view.view.frame.size.width * count;
            dispatch_async(dispatch_get_main_queue(), ^{
                featureView.view.frame = frame;
            });
            [view.featuresViews addObject:featureView];
            if(view.currentPokemonId == [pokeId shortValue]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [view.mainScrollView setContentOffset:CGPointMake(view.view.frame.size.width * count, 0) animated:NO];
                });
            }
            count++;
            dispatch_async(dispatch_get_main_queue(), ^{
                [view addSubViewWithView:featureView.view];
            });
        }
        // On quitte le mode asynchrone pour impacter la vue
        dispatch_async(dispatch_get_main_queue(), ^{
            view.title = @"Description";
        });
    }];
    [dataTask resume];
    return pokemonIds;
}

/// Récupère tous les Pokemon depuis le webservice avec
/// la chaine de caractère fournie en paramètre (recherche)
+ (NSMutableArray<Pokemon*>*) getAllPokemonsWithRootView:(RootViewController*) view andSearchPattern:(NSString*) pattern{
    __block NSMutableArray<Pokemon*> *pokemonsList = [[NSMutableArray alloc] init];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@%@", baseApiUrl, @"/pokemon", [[Tools getLocaleLanguage] capitalizedString], @"/search/", pattern]]];
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

/// Récupère un Pokemon depuis le webservice avec son id
+ (void) getPokemonWithId:(unsigned short) pokemonId andFeatureView:(FeaturesViewController*) featureView {
    __block Pokemon *pokemon = nil;
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@%hu", baseApiUrl, @"/pokemon", [[Tools getLocaleLanguage] capitalizedString], @"/", pokemonId]]];
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
                    featureView.backgroundImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"BG%@.png", [StringRessources getEnTypesForString:[pokemon.types objectAtIndex:0]]]];
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

/// Récupère le sprite du pokemon depuis le serveur avec son id (RootView)
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

/// Récupère l'image du pokemon depuis le serveur avec son id (FeaturesView)
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

/// Récupère le sprite du pokemon depuis le serveur avec son id (GMSMarker)
+ (void) getPokemonSpriteWithId:(unsigned short) pokemonId andGMarker:(GMSMarker*) marker{
    marker.icon = [UIImage imageNamed:@"Pokeball"];
    
    NSString *spriteUrl = [NSString stringWithFormat:@"%@/sprites/%hu.png", baseImageUrl, pokemonId];
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:spriteUrl]];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error){
            
            // On quitte le mode asynchrone pour impacter la vue
            dispatch_async(dispatch_get_main_queue(), ^{
                marker.icon = [UIImage imageWithData:data];
            });
        }
    }];
    [dataTask resume];
}

/// Récupère tous les Pokemon depuis le webservice
+ (NSMutableArray<PokemonPosition*>*) getPokemonsPositionsWithPokemonPositionView:(PokemonPositionViewController*) view andPosition:(CLLocationCoordinate2D) position{
    __block NSMutableArray<PokemonPosition*> *positions = [[NSMutableArray alloc] init];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@/%@", baseApiUrl, @"/pokemonPosition/", [[NSString stringWithFormat:@"%f", position.longitude] stringByReplacingOccurrencesOfString:@"." withString:@"," ], [[NSString stringWithFormat:@"%f", position.latitude] stringByReplacingOccurrencesOfString:@"." withString:@"," ]]]];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error){
            NSError* jsonError = nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            for (id key in dict) {
                PokemonPosition *pokePosition = [[PokemonPosition alloc] initWithNSDictionnary:key];
                [positions addObject:pokePosition];
                GMSMarker *marker = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(pokePosition.latitude, pokePosition.longitude)];
                [PokeDataLayer getPokemonSpriteWithId:pokePosition.number andGMarker:marker];
                marker.title = @"Pokemon";
                marker.map = view.mapView;
            }
        }
        // On quitte le mode asynchrone pour impacter la vue
        dispatch_async(dispatch_get_main_queue(), ^{
            // TODO
        });
    }];
    [dataTask resume];
    return positions;
}

@end
