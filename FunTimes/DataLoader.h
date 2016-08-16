//
//  DataLoader.h
//  FunTimes
//
//  Created by Christopher Dugan on 4/21/14.
//  Copyright (c) 2014 Flyby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataLoader : NSObject

+ (void) getJsonDataWithCompletion:(void (^)(NSMutableArray *data))completion;

@property (strong) NSString *key;

@end
