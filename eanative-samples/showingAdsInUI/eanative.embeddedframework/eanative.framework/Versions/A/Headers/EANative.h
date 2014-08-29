//
//  ElasticAd.h
//  eanative
//
//  Copyright (c) 2014 ElasticAd. All rights reserved.
//

#import <eanative/EAConstants.h>
#import <eanative/EAAdView.h>
#import <eanative/EAAdTableViewCell.h>
#import <eanative/EATableViewProxy.h>

@interface EANative : NSObject

/*
 @param appKey: ElasticAd app key
 */
+ (void)initializeWithAppKey:(NSString *)appKey;

/*
 @param testDevices: should contain a list of UDIDs as strings
*/
+ (void)setTestMode:(NSArray *)testDevices;

+ (void)setDevMode:(NSString *)devMode;

@end
