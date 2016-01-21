//
//  EAAdViewController.m
//  Elasticad-SDK
//
//  Created by Alexandru Tudose on 27.05.2014.
//  Copyright (c) 2014 elasticad. All rights reserved.
//

#import "EAAdViewController.h"


@interface EAAdViewController ()

@end

@implementation EAAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *placementID = @"2061";
    self.adView = [EAAdView adWithPlacementID:placementID adFormat:EANativeAdFormat_sample3 config:nil];
    self.adView.frame = CGRectMake(0, 0, self.adView.frame.size.width, self.adView.frame.size.height);
    self.adView.delegate = self;
    [self.view addSubview:self.adView];
}

#pragma mark - EAAdViewDelegate

- (void)adViewDidReceiveAd:(EAAdView *)adView {
    self.adView.hidden = NO;
}

- (void)adView:(EAAdView *)view didFailToReceiveAdWithError:(NSError *)error {
    self.adView.hidden = YES;
}
+ (CGSize)getAdSize{
    return  CGSizeMake(320, 200);
}
@end
