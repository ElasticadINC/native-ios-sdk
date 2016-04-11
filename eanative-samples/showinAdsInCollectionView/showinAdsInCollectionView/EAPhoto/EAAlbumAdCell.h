//
//  BHAlbumPhotoCell.h
//  ElasticAd-Sample
//
//  Created by Beniamin Duca on 19/01/16.
//  Copyright © 2016 ElasticAd. All rights reserved.
//

#ifndef BHAlbumPhotoCell_h
#define BHAlbumPhotoCell_h


#endif /* EAAlbumPhotoCell_h */
#import <UIKit/UIKit.h>
#import "EATestAdViewController.h"

@interface EAAlbumAdCell : UICollectionViewCell

@property (nonatomic, strong, readwrite) EATestAdViewController *adController;
-(void)setAdController:(EATestAdViewController *)adController;
@end