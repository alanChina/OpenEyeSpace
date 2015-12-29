//
//  LMToolBar.m
//  OpenEye
//
//  Created by by on 15/12/29.
//  Copyright © 2015年 dlm. All rights reserved.
//

#import "LMToolBar.h"

@implementation LMToolBar
-(CGSize)intrinsicContentSize {
    return CGSizeMake(UIViewNoIntrinsicMetric, 85);
}
- (CGSize)sizeThatFits:(CGSize)size {
    CGSize result = [super sizeThatFits:size];
    result.height = 65;
    return result;
};
@end
