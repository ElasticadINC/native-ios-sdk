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

// register in table view as nib
static NSString *EAAdTableViewCellIdentifier_Custom = @"EAAdTableViewCell";

@interface EATableViewProxy : NSProxy

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSUInteger adStartPosition;
@property (nonatomic, assign) NSUInteger adFrequency;
@property (nonatomic, assign) CGFloat adCustomHeight;
@property (nonatomic, assign) EANativeAdFormat adViewType;

- (id)initWithPlacementID:(NSString *)placementID tableView:(UITableView *)tableView adFormat:(EANativeAdFormat)adFormat config:(EAAdConfig *)config;
+ (id)proxyWithPlacementID:(NSString *)placementID tableView:(UITableView *)tableView adFormat:(EANativeAdFormat)adFormat config:(EAAdConfig *)config;

@end
