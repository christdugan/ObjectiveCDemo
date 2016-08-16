//
//  LegendaryDoc.m
//  FunTimes
//
//  Created by Christopher Dugan on 4/16/14.
//  Copyright (c) 2014 Flyby. All rights reserved.
//

#import "LegendaryDoc.h"
#import "LegendaryData.h"

@implementation LegendaryDoc

@synthesize data = _data;
@synthesize thumbImage = _thumbImage;
@synthesize fullImage = _fullImage;
@synthesize video = _video;

- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage*)fullImage video:(NSURL *)video {
    if ((self = [super init])) {
        self.data = [[LegendaryData alloc] initWithTitle:title rating:rating];
        self.thumbImage = thumbImage;
        self.fullImage = fullImage;
        self.video = video;
    }
    return self;
}

@end
