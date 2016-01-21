//
//  EAAlbumPhotoCell.m
//  ElasticAd-Sample
//
//  Created by Beniamin Duca on 19/01/16.
//  Copyright © 2016 ElasticAd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EAAlbumAdCell.h"

@interface EAAlbumAdCell ()


@end

@implementation EAAlbumAdCell
- (void) setAdController:(EAAdViewController *)adController{
    if(_adController!=nil){
        [_adController.view removeFromSuperview];
    }
    _adController = adController;
    adController.view.frame = self.contentView.frame;
    if(adController!=nil){
        [self.contentView addSubview:adController.view];
    }
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
        
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        //self.layer.borderWidth = 3.0f;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = 3.0f;
        self.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
        self.layer.shadowOpacity = 0.5f;
        
    }
    
    return self;
}
- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.adController = nil;
}
@end