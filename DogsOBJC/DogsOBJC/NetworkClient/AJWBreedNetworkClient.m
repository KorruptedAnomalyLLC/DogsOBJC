//
//  AJWBreedNetworkClient.m
//  DogsOBJC
//
//  Created by Austin West on 5/22/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import "AJWBreedNetworkClient.h"
#import "AJWBreed.h"
#import "AJWSubBreed.h"

static NSString * const baseURLString = @"https://dog.ceo/api";

@implementation AJWBreedNetworkClient

// Shared instance
+(AJWBreedNetworkClient *)sharedController
{
    static AJWBreedNetworkClient *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [AJWBreedNetworkClient new];
    });
    return sharedController;
}

-(void)fetchAllBreed: (void (^) (NSArray *))completion
{
    //https://dog.ceo/api
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    //https://dog.ceo/api/breeds/list/all
    baseURL = [[[baseURL URLByAppendingPathComponent: @"breeds"] URLByAppendingPathComponent:@"list"] URLByAppendingPathComponent:@"all"];
    
    [[[NSURLSession sharedSession]dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // handle error
        if (error) {
            NSLog(@"Error fetching breed of dogs from search term: %@", error);
            completion(nil);
            return;
        }
        //hand missing data
        if(!data) {
            NSLog(@"Error fetching breeds data from search term: %@", error);
            completion(nil);
            return;
        }
        //serialize to a jsonDictionary
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        //check to see that we got a JSONDictionary back
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error fetching json dictionary %@", error);
            completion(nil);
            return;
        }
        
        //Get the messages dictionary from the top level dictionary
        NSDictionary *messageDictionary = jsonDictionary[@"message"];
        //make an array to store all breeds into
        NSMutableArray *breeds = [[NSMutableArray alloc] init];
        //loop through dictionary to make keys to breeds and calues into subBreeds
        for(id key in messageDictionary)
        {
            //create subBreeds array
            NSMutableArray *subBreeds = [[NSMutableArray alloc] init];
            //create subbreeds from values
            for (NSString *name in messageDictionary[key])
            {
                AJWSubBreed *subBreed = [[AJWSubBreed alloc] initWithName:name imageURLs:[[NSMutableArray alloc]init]];
                [subBreeds addObject:subBreed];
            }
            //complete with array of breeds
            completion(breeds);
        }
    }] resume];
}
    @end
