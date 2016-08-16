//
//  LegendaryDoc.h
//  FunTimes
//
//  Created by Christopher Dugan on 4/16/14.
//  Copyright (c) 2014 Flyby. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LegendaryData;

@interface LegendaryDoc : NSObject

@property (strong) LegendaryData *data;
@property (strong) UIImage *thumbImage;
@property (strong) UIImage *fullImage;
@property (strong) NSURL *video;

- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage*)fullImage video:(NSURL*)video;

@end
