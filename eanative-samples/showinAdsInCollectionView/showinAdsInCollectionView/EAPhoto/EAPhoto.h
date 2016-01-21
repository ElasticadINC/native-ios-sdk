//
//  BHPhoto.h
//  CollectionViewTutorial
//
//  Created by Bryan Hansen on 11/3/12.
//  Copyright (c) 2012 Bryan Hansen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface EAPhoto : NSObject

@property (nonatomic, strong, readonly) NSURL *imageURL;
@property (nonatomic, strong, readonly) UIImage *image;

+ (EAPhoto *)photoWithImageURL:(NSURL *)imageURL;

- (id)initWithImageURL:(NSURL *)imageURL;
- (id)getImage:(void (^)(BOOL succeeded, UIImage *image))completitionBlock;

@end
