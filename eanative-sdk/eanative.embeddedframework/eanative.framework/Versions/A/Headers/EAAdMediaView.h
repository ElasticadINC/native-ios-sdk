//
//  EAAdMediaView.h
//  eanative
//
//  Created by Beniamin Duca on 10/03/16.
//  Copyright © 2016 ElasticAd. All rights reserved.
//

#ifndef EAAdMediaView_h
#define EAAdMediaView_h


#endif /* EAAdMediaView_h */
#import <UIKit/UIKit.h>
#import "EAMediaGallery.h"

@interface EAAdMediaView : UIView
/* The image view which will be used to display the ad image. */
@property (nonatomic, strong) UIImageView *imageView;
@property (strong, nonatomic) EAMediaGallery *imageGallery;
@property (nonatomic, assign) BOOL autoPlayEnabled;

@end