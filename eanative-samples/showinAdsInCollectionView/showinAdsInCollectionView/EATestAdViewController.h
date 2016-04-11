//
//  EAAdViewController.h
//  Elasticad-SDK
//
//  Created by Alexandru Tudose on 27.05.2014.
//  Copyright (c) 2014 elasticad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "eanative/EAAdViewController.h"

@interface EATestAdViewController : UIViewController<EAAdViewDelegate>

@property (nonatomic, strong) EAAdViewController *adView;

@end
