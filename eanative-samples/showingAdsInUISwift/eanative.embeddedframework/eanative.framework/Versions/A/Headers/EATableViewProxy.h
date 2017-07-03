//
//  EATableViewProxy.h
//  eanative
//
//  Copyright (c) 2014 elasticad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EAConstants.h"
#import "EAAdConfig.h"


@interface EATableViewProxy : NSProxy

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSUInteger adStartPosition;
@property (nonatomic, assign) NSUInteger adFrequency;

- (id)initWithPlacementID:(NSString *)placementID tableView:(UITableView *)tableView adFormat:(EANativeAdFormat)adFormat config:(EAAdConfig *)config withController:(UIViewController*)controller;
+ (id)proxyWithPlacementID:(NSString *)placementID tableView:(UITableView *)tableView adFormat:(EANativeAdFormat)adFormat config:(EAAdConfig *)config withController:(UIViewController*)controller;


+ (id)proxyWithCustomFormat:(NSString *)placementID tableView:(UITableView *)tableView imageType:(EAAdImageType)imageType customAdNibName:(NSString *)customNibName customAdHeight:(CGFloat)customAdHeight  config:(EAAdConfig *)config;
- (id)initWithCustomFormat:(NSString *)placementID tableView:(UITableView *)tableView imageType:(EAAdImageType)imageType customAdNibName:(NSString *)customAdNibName customAdHeight:(CGFloat)customAdHeight  config:(EAAdConfig *)config;


- (void)setCustomAdViewType:(EAAdImageType)imageType customAdNibName:(NSString*)customAdNibName customAdHeight:(CGFloat)customAdHeight;
- (void)setAdViewType:(EANativeAdFormat)adViewType;
- (void)setAdCustomHeight:(CGFloat)adCustomHeight;
@end
