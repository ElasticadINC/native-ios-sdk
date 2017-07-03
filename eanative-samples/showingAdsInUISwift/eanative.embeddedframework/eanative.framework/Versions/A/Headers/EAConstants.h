//
//  EAConstants.h
//  eanative
//
//  Copyright (c) 2014 elasticad. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    EANativeAdFormat_sample1 = 1,
    EANativeAdFormat_sample2 = 2,
    EANativeAdFormat_sample3 = 3,
    EANativeAdFormat_sample4 = 4,
    EANativeAdFormat_custom = 5
} EANativeAdFormat;

typedef enum : NSUInteger {
    EAAdImageType_Square,
    EAAdImageType_Portrait,
    EAAdImageType_Landscape,
    EAAdImageType_LargeLandscape,
    EAAdImageType_BrandLogo
} EAAdImageType;

typedef enum : NSUInteger {
    EAEnv_Dev,
    EAEnv_PreLive,
    EAEnv_Live
} EAEnvMode;