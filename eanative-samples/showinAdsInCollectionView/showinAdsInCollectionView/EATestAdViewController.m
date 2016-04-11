//
//  EAAdViewController.m
//  Elasticad-SDK
//
//  Created by Alexandru Tudose on 27.05.2014.
//  Copyright (c) 2014 elasticad. All rights reserved.
//

#import "EATestAdViewController.h"


@interface EATestAdViewController ()

@end

@implementation EATestAdViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    NSString *placementID = @"2061";

    self.adView = [EAAdViewController adWithPlacementID:placementID adFormat:EANativeAdFormat_sample3 config:nil];
    self.adView.view.frame = CGRectMake(0, 0, self.adView.view.frame.size.width, self.adView.view.frame.size.height);
    self.adView.delegate = self;
    self.adView.view.hidden = YES;
    
    [self.view addSubview:self.adView.view];
}

#pragma mark - EAAdViewDelegate

- (void)adViewDidReceiveAd:(EAAdViewController *)adView {
    self.adView.view.hidden = NO;
    NSLog(@"ad loaded");
}

- (void)adView:(EAAdViewController *)view didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"error while loading an ad %@",error.description);
}
+ (CGSize)getAdSize{
    return  CGSizeMake(320, 150);
}
@end
