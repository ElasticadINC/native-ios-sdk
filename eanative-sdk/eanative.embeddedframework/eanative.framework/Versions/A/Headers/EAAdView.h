//
//  EAAdView.h
//  eanative
//
//  Copyright (c) 2014 elasticad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EANative.h"
#import "EAAdConfig.h"

@protocol EAAdViewDelegate;
@class EAAd;

@interface EAAdView : UIView

@property (nonatomic, weak) id<EAAdViewDelegate> delegate;

/* The label which will be used to display the ad title. */
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

/* The label which will be used to display the ad summary. */
@property (nonatomic, weak) IBOutlet UILabel *summaryLabel;

/* The image view which will be used to display the ad image. */
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

/* The label which will be used to display the brand name. */
@property (nonatomic, weak) IBOutlet UILabel *brandNameLabel;

/* The label which will be used to display the "Sponsored by" text. */
@property (nonatomic, weak) IBOutlet UILabel *sponsoredLabel;

/* The image view which will be used to display the brand logo image. */
@property (nonatomic, weak) IBOutlet UIImageView *brandLogoImageView;

/* Returns an ad view with the specified type and configuration. */
+ (id)adWithPlacementID:(NSString *)placementID
               adFormat:(EANativeAdFormat)adFormat
                 config:(EAAdConfig *)config;

@end

@interface EAAdView (Customize)

/* Returns a custom ad view initialized from the specified nib file & with the specified image type & configuration. */
+ (id)customAdWithPlacementID:(NSString *)placementID
                      nibName:(NSString *)nibName
                    imageType:(EAAdImageType)imageType
                       config:(EAAdConfig *)config;

@end



/* Delegate for receiving state change messages, such as succeeding/failing */
@protocol EAAdViewDelegate <NSObject>

@optional
/* Called when an ad was loaded. */
- (void)adViewDidReceiveAd:(EAAdView *)adView;

/* Called when an ad failed. Normally this is because no network connection was available
 or no ads were available (i.e. no fill). */
- (void)adView:(EAAdView *)view didFailToReceiveAdWithError:(NSError *)error;

@end