//
//  LMLoginContainerController.h
//  OpenEye
//
//  Created by by on 15/12/28.
//  Copyright © 2015年 dlm. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HiddenLoginViewBlock)(NSInteger btnTag);
@interface LMLoginContainerController : UINavigationController
@property (nonatomic, copy) HiddenLoginViewBlock hiddenCallBack;
@end
