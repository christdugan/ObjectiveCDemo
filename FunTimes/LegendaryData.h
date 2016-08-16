//
//  LegendaryData.h
//  FunTimes
//
//  Created by Christopher Dugan on 4/16/14.
//  Copyright (c) 2014 Flyby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LegendaryData : NSObject

@property (strong) NSString *title;
@property (assign) float rating;

- (id)initWithTitle:(NSString*)title rating:(float)rating;

@end
