//
//  EAAdUICollectionView.m
//  ElasticAd-Sample
//
//  Created by Beniamin Duca on 19/01/16.
//  Copyright © 2016 ElasticAd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EAAdUICollectionViewController.h"
#import "EAPhoto.h"
#import "EAAlbumPhotoCell.h"
#import "EAAlbumAdCell.h"
#import <eanative/EANative.h>
static NSString * const PhotoCellIdentifier = @"PhotoCell";
static NSString * const AdCellIdentifier = @"AdCell";
static NSInteger const AdFrequency = 5; //must be grater than 1
static NSInteger const AdStartPosition = 2;
@interface EAAdUICollectionViewController () < UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) NSMutableArray *photos;
@property(nonatomic, strong) NSMutableDictionary *ads;
@end

@implementation EAAdUICollectionViewController

-(void)viewDidLoad{
    [EANative initializeWithAppKey:@"eanative-test-key"];
    
    self.photos = [@[] mutableCopy];
    self.ads = [[NSMutableDictionary alloc]init];
    self.collectionView.frame = self.view.bounds;
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
    
    
    NSURL *urlPrefix =
    [NSURL URLWithString:@"https://raw.githubusercontent.com/ElasticadINC/native-ios-sdk/master/eanative-samples/images/"];
    
    for (NSInteger p = 1; p < 25; p++) {
        // there are up to 26 photos available to load from the code repository
        NSString *photoFilename = [NSString stringWithFormat:@"thumbnail%ld.jpg",p];
        NSURL *photoURL = [urlPrefix URLByAppendingPathComponent:photoFilename];
        EAPhoto *photo = [EAPhoto photoWithImageURL:photoURL];
        [self.photos addObject:photo];
        
    }
    
    [self.collectionView registerClass:[EAAlbumPhotoCell class]
            forCellWithReuseIdentifier:PhotoCellIdentifier];
    [self.collectionView registerClass:[EAAlbumAdCell class]
            forCellWithReuseIdentifier:AdCellIdentifier];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.photos.count;
    if (AdFrequency>1) {
        if (count > AdStartPosition) {
            count = count + (count - AdStartPosition) / (AdFrequency - 1) + 1;
        }
    }
    return count;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    int position = (int)(indexPath.section * self.photos.count + indexPath.item);
    if([self isAdCell:indexPath]== true){
        
        EAAlbumAdCell *adCell =
        [collectionView dequeueReusableCellWithReuseIdentifier:AdCellIdentifier
                                                  forIndexPath:indexPath];
        NSString * keyPosition = [NSString stringWithFormat:@"ad_%d",position];
        EAAdViewController * adController=[self.ads objectForKey:keyPosition];
        if(adController == nil){
            adController = [[EAAdViewController alloc] init];
            [self.ads setObject:adController forKey:keyPosition];
        }
        [adCell setAdController:adController];
        return adCell;

    }else{
        EAAlbumPhotoCell *photoCell =
        [collectionView dequeueReusableCellWithReuseIdentifier:PhotoCellIdentifier
                                                  forIndexPath:indexPath];
        
        NSIndexPath* newIndexPath = [self dataIndexPathForCollectionIndexPath:indexPath];
        
        EAPhoto *photo = self.photos[newIndexPath.item];
        
        [photo getImage:^(BOOL succeeded, UIImage *image) {
            //photoCell.imageView.image = image;
            [UIView transitionWithView:photoCell.imageView
                              duration:0.2f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                photoCell.imageView.image = image;
                            } completion:NULL];
        }];
        return photoCell;
    }
    
}
- (NSIndexPath *)dataIndexPathForCollectionIndexPath:(NSIndexPath *)indexPath {
    if ([self isAdCell:indexPath]) {
        return nil;
    }
    
    if (indexPath.item < AdStartPosition) {
        return indexPath;
    }
    
    NSInteger position = indexPath.item - (indexPath.item - AdStartPosition) / AdFrequency - 1;
    position = MAX(0, position);
    return [NSIndexPath indexPathForItem:position inSection:indexPath.section];
}

- (BOOL)isAdCell:(NSIndexPath *)indexPath{
    NSInteger position = indexPath.item - AdStartPosition;
    if (position < 0) {
        return NO;
    }
    
    BOOL showAd = position % AdFrequency == 0;
    return showAd;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

#pragma mark – UICollectionViewDelegateFlowLayout


// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if([self isAdCell:indexPath]==true){
        return [EAAdViewController getAdSize];
    }else{
        return CGSizeMake(320, 200);
    }
    
}

// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 10, 10, 10);
}

@end
