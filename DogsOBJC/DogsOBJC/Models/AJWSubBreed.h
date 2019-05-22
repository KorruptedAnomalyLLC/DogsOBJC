//
//  AJWSubBreed.h
//  DogsOBJC
//
//  Created by Austin West on 5/22/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AJWSubBreed : NSObject

@property (nonatomic, copy, readonly)NSString *name;
@property (nonatomic, copy, readonly)NSArray *imageURLs;

// initializer
-(instancetype)initWithName:(NSString *)name imageURLs:(NSArray *)imageURLs;


@end

NS_ASSUME_NONNULL_END
