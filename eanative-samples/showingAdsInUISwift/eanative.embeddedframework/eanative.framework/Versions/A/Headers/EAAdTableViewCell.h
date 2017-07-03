//
//  EAAdCell.h
//  eanative
//
//  Copyright (c) 2014 elasticad. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAAd, EAAdViewController;
@interface EAAdTableViewCell : UITableViewCell

@property (nonatomic, strong) EAAdViewController *adView;
- (void)setAdView:(EAAdViewController *)adView;
@end
