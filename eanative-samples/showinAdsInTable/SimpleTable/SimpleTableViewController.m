//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by eanative.
//  Copyright (c) 2014 eanative. All rights reserved.


#import "SimpleTableViewController.h"


#import <eanative/EATableViewProxy.h>
#import <eanative/eanative.h>
#import <eanative/EAConstants.h>

@interface SimpleTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableViewUI;

@end

@implementation SimpleTableViewController
{
    NSMutableArray *tableData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Initialize table data
    tableData = [NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    //Initialize the SDK with the api key received when you registred your app.
    [EANative initializeWithAppKey:@"eanative-test-key"];
    //Initialize the table view proxy with the desired ad type
    
    EATableViewProxy *tableViewProxy = [[EATableViewProxy alloc] initWithPlacementID:@"2061" tableView:self.tableViewUI adFormat:EANativeAdFormat_sample1 config:nil withController:self];
    //Configure the table view proxy in regards to the ad start position & ad frequency
    tableViewProxy.adStartPosition = 3;
    tableViewProxy.adFrequency = 5;
    
    //Replace the table view with our proxy
    self.tableViewUI = (id)tableViewProxy;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    [tableData removeObjectAtIndex:indexPath.row];
    
    // Request table view to reload
    [tableView reloadData];
}

@end

