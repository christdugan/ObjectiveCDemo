//
//  DetailViewController.h
//  FunTimes
//
//  Created by Christopher Dugan on 4/16/14.
//  Copyright (c) 2014 Flyby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "RateView.h"
#import "MediaPlayer/MediaPlayer.h"

@class LegendaryDoc;

@interface DetailViewController : UIViewController <UITextFieldDelegate, RateViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) LegendaryDoc *detailItem;
@property (strong, nonatomic) UIImagePickerController *picker;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet RateView *rateView;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

- (IBAction)addPictureTapped:(id)sender;
- (IBAction)titleFieldTextChanged:(id)sender;
- (IBAction)playVideo:(id)sender;

@end
