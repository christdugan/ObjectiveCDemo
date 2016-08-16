//
//  LegendaryData.m
//  FunTimes
//
//  Created by Christopher Dugan on 4/16/14.
//  Copyright (c) 2014 Flyby. All rights reserved.
//

#import "LegendaryData.h"

@implementation LegendaryData

@synthesize title = _title;
@synthesize rating = _rating;

- (id)initWithTitle:(NSString*)title rating:(float)rating {
    if ((self = [super init])) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}

@end
