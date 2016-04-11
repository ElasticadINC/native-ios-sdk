//
//  ViewController.m
//  showingAdsInUI
//
//  Created by eanative on 28/08/14.
//  Copyright (c) 2014 eanative. All rights reserved.
//

#import "ViewController.h"
#import <eanative/EAAdViewController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Override point for customization after application launch.
    
    //Create the ad view
    EAAdViewController *adViewController = [EAAdViewController adWithPlacementID:@"2061" adFormat:EANativeAdFormat_sample4 config:nil];
    
    //adjust its position
    adViewController.view.center = CGPointMake(150, 100);
    
    [self addChildViewController:adViewController];
    //add it to your view hierarchy
    [self.view addSubview:adViewController.view];

    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
