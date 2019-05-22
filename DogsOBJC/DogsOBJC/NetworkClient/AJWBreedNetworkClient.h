//
//  AJWBreedNetworkClient.h
//  DogsOBJC
//
//  Created by Austin West on 5/22/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AJWBreed;
@class AJWImage;
@class AJWSubBreed;

@interface AJWBreedNetworkClient : NSObject

//      Fetch a list of all breeds and sub breeds
-(void)fetchAllBreeds: (void (^) (NSArray *))completion;

// fetch the URLs for the breed images
//https://dog.ceo/api/breed/hound/images
-(void)fetchBreedImageURLs:(AJWBreed *)breed completion:(void(^) (NSArray *))completion;

//   Fetch subbreed image URLs
-(void)fetchSubBreedImageURLs:(AJWSubBreed *)subBreed breed:(AJWBreed *)breed completion:(void(^) (NSArray *))completion;

//  Fetch image data
-(void)fetchImageData:(NSURL *)url completion:(void(^)(NSData *imageData, NSError *error))completion;

// shared instance method
+ (AJWBreedNetworkClient *)sharedController;


@end

NS_ASSUME_NONNULL_END
