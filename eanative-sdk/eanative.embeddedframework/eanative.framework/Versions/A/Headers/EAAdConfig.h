//
//  EAConfig.h
//  eanative
//
//  Copyright (c) 2014 elasticad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EAAdConfig : NSObject

/* Scale modes for different type of images. */
@property (nonatomic, copy) NSString *scaleImageSquare;
@property (nonatomic, copy) NSString *scaleImagePortrait;
@property (nonatomic, copy) NSString *scaleImageLandscape;
@property (nonatomic, copy) NSString *scaleImageLargeLandscape;
@property (nonatomic, copy) NSString *scaleBrandLogo;

@end
