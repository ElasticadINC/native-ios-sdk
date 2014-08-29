//
//  ViewController.m
//  showingAdsInUI
//
//  Created by Macbook on 28/08/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import <eanative/EAAdView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Override point for customization after application launch.
    
    //Create the ad view
    EAAdView *adView = [EAAdView adWithPlacementID:@"2061" adFormat:EANativeAdFormat_sample1 config:nil];
    
    //adjust its position
    adView.center = CGPointMake(150, 100);
    
    //add it to your view hierarchy
    [self.view addSubview:adView];

    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
