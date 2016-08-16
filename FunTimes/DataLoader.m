//
//  DataLoader.m
//  FunTimes
//
//  Created by Christopher Dugan on 4/21/14.
//  Copyright (c) 2014 Flyby. All rights reserved.
//

#import "DataLoader.h"
#import "LegendaryDoc.h"

@implementation DataLoader

+ (void) getJsonDataWithCompletion:(void (^)(NSMutableArray *data))completion {

    NSString *legendaryURLString = [NSString stringWithFormat:@"http://dl.dropboxusercontent.com/u/637000/party.json"];
    NSURL *url = [NSURL URLWithString:legendaryURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    //operation.responseSerializer = [AFJSONResponseSerializer serializer];
    NSMutableArray *data = [[NSMutableArray alloc] init];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        
        // Get JSON from operation.responseString as an NSString
        NSString *jsonString = operation.responseString;
        
        // Figure out how to get JSON from NSString
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        id json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        
        if ([[json objectForKey:@"data"] isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *dataDictionary = [json objectForKey:@"data"];
            
            for(NSString *key in dataDictionary) {
                if ([key isEqualToString:@"legendaries"]) {
                    NSMutableArray *legendariesArray = [dataDictionary objectForKey:key];
                    for (NSDictionary *legendaryEntry in legendariesArray) {
                        
                        float tempRating = [[legendaryEntry valueForKey:@"rating"] floatValue];
                        LegendaryDoc *tempLegendary = [[LegendaryDoc alloc] initWithTitle:[legendaryEntry valueForKey:@"title"]
                                                                                   rating:tempRating
                                                                               thumbImage:[UIImage imageNamed:[legendaryEntry valueForKey:@"thumbImage"]]
                                                                                fullImage:[UIImage imageNamed:[legendaryEntry valueForKey:@"fullImage"]]
                                                                                    video:[NSURL URLWithString:[legendaryEntry valueForKey:@"video"]]];
                        
                        [data addObject:tempLegendary];
                    }
                }
                
                if(completion) completion(data);
            }

        }
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Legendaries"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles: nil];
        [alertView show];
    }];
    [operation start];
}
     
@end
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
//    NSError *error = nil;
//    
//    NSData *fileContents = [NSData dataWithContentsOfFile:filePath];
//    id json = [NSJSONSerialization JSONObjectWithData:fileContents options:kNilOptions error:&error];
    
//    if ([[json objectForKey:@"data"] isKindOfClass:[NSDictionary class]]) {
//        NSDictionary *dataDictionary = [json objectForKey:@"data"];
//            for(NSString *key in dataDictionary) {
//                if ([key isEqualToString:@"legendaries"]) {
//                    NSMutableArray *legendariesArray = [dataDictionary objectForKey:key];
//                    for (NSDictionary *legendaryEntry in legendariesArray) {
//
//                        float tempRating = [[legendaryEntry valueForKey:@"rating"] floatValue];
//                        
//                        LegendaryDoc *tempLegendary = [[LegendaryDoc alloc] initWithTitle:[legendaryEntry valueForKey:@"title"]
//                                                                                   rating:tempRating
//                                                                               thumbImage:[UIImage imageNamed:[legendaryEntry valueForKey:@"thumbImage"]]
//                                                                                fullImage:[UIImage imageNamed:[legendaryEntry valueForKey:@"fullImage"]]];
//                        
//                        [data addObject:tempLegendary];
//                    }
//                }
//                else if ([key isEqualToString:@"parties"]) {
//                    return nil;
//                }
//            }
//        }
//    return data;
