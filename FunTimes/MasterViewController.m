//
//  MasterViewController.m
//  FunTimes
//
//  Created by Christopher Dugan on 4/16/14.
//  Copyright (c) 2014 Flyby. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "LegendaryDoc.h"
#import "LegendaryData.h"
#import "DataLoader.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize legendaries = _legendaries;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Legendary Cards";
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                              target:self action:@selector(addTapped:)];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _legendaries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"MyBasicCell"];
    LegendaryDoc *legendary = [self.legendaries objectAtIndex:indexPath.row];
    cell.textLabel.text = legendary.data.title;
    cell.imageView.image = legendary.thumbImage;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_legendaries removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone]; //other animations?
    }

}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailController =segue.destinationViewController;
    LegendaryDoc *legendary = [self.legendaries objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailController.detailItem = legendary;
}

-(void)didMoveToParentViewController:(UIViewController *)parent{
    [self.tableView reloadData];
}

- (void)addTapped:(id)sender {
    LegendaryDoc *newDoc = [[LegendaryDoc alloc] initWithTitle:@"New Legendary" rating:0 thumbImage:nil fullImage:nil video:nil];
    [_legendaries addObject:newDoc];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_legendaries.count-1 inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
    
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self performSegueWithIdentifier:@"MySegue" sender:self];
}

- (void)setLegendaries:(NSMutableArray *)legendaries {
    _legendaries = legendaries;
    [self.tableView reloadData];
}

@end
