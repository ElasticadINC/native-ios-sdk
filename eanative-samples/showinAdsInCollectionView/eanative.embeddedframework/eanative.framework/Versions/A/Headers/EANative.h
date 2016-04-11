//
//  ElasticAd.h
//  eanative
//
//  Copyright (c) 2014 ElasticAd. All rights reserved.
//

#import <eanative/EAConstants.h>
#import <eanative/EAAdViewController.h>
#import <eanative/EAAdTableViewCell.h>
#import <eanative/EATableViewProxy.h>
#define EA_SDK_VERSION @"4.0.1"

@interface EANative : NSObject

/*
 @param appKey: ElasticAd app key
 */
+ (void)initializeWithAppKey:(NSString *)appKey;

/*
 @param testDevices: should contain a list of UDIDs as strings
*/
+ (void)setTestMode:(NSArray *)testDevices;

+ (void)setEnviroment:(EAEnvMode)enviroment;

/*
 returns the SDK version
 */
+ (NSString *)getSDKVersion;

@end
