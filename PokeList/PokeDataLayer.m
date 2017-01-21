//
//  PokeDataLayer.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 21/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "PokeDataLayer.h"

@implementation PokeDataLayer

const NSString *baseApiUrl = @"http://pokelist.azurewebsites.net/api";

+ (NSMutableArray<Pokemon*>*) getAllPokemons {
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
    }];
    [dataTask resume];
    return pokemonsList;
}

@end
