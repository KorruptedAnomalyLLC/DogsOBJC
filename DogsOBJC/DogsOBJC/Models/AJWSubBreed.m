//
//  AJWSubBreed.m
//  DogsOBJC
//
//  Created by Austin West on 5/22/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import "AJWSubBreed.h"

@implementation AJWSubBreed

- (instancetype)initWithName:(NSString *)name imageURLs:(NSArray *)imageURLs
{

self = [super init];
if(self) {
    _name = name;
    _imageURLs = imageURLs;
}
return self;
}



@end
