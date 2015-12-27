//
//  LMLoginView.h
//  OpenEye
//
//  Created by by on 15/12/27.
//  Copyright © 2015年 dlm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HiddenLoginViewBlock)(NSInteger btnTag);

@interface LMLoginView : UIView

@property (nonatomic, copy) HiddenLoginViewBlock hiddenCallBack;

@end
