//
//  BHPhoto.m
//  CollectionViewTutorial
//
//  Created by Bryan Hansen on 11/3/12.
//  Copyright (c) 2012 Bryan Hansen. All rights reserved.
//

#import "EAPhoto.h"

@interface EAPhoto ()

@property (nonatomic, strong, readwrite) NSURL *imageURL;
@property (nonatomic, strong, readwrite) UIImage *image;

@end

@implementation EAPhoto

#pragma mark - Properties

- (UIImage *)getImage:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    if (!_image && self.imageURL) {
        [self downloadImageWithURL:self.imageURL completionBlock:^(BOOL succeeded, NSData *data) {
            completionBlock(succeeded,[[UIImage alloc] initWithData:data]);
        }];
    }
    
    return _image;
}

#pragma mark - Lifecycle

+ (EAPhoto *)photoWithImageURL:(NSURL *)imageURL
{
    return [[self alloc] initWithImageURL:imageURL];
}

- (id)initWithImageURL:(NSURL *)imageURL
{
    self = [super init];
    if (self) {
        self.imageURL = imageURL;
    }
    return self;
}
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, NSData *data))completionBlock
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData * imageData = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(YES,imageData);
        });
    });
}
@end
