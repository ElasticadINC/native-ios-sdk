//
//  EAAlbumPhotoCell.m
//  ElasticAd-Sample
//
//  Created by Beniamin Duca on 19/01/16.
//  Copyright © 2016 ElasticAd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EAAlbumPhotoCell.h"

@interface EAAlbumPhotoCell ()

@property (nonatomic, strong, readwrite) UIImageView *imageView;

@end

@implementation EAAlbumPhotoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
        
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 3.0f;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = 3.0f;
        self.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
        self.layer.shadowOpacity = 0.5f;
        
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        
        [self.contentView addSubview:self.imageView];
    }
    
    return self;
}
- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.imageView.image = nil;
}
@end