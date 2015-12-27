//
//  LMLoginView.m
//  OpenEye
//
//  Created by by on 15/12/27.
//  Copyright © 2015年 dlm. All rights reserved.
//

#import "LMLoginView.h"

#define Width CGRectGetWidth(frame)

@implementation LMLoginView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:0.8]];
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Width, CGRectGetHeight(frame) - 48)];
        [scrollView setScrollEnabled:YES];
        [scrollView setUserInteractionEnabled:YES];
        [scrollView setBounces:YES];
        [scrollView setShowsVerticalScrollIndicator:YES];
        [self addSubview:scrollView];
        
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), 230)];
        [topView setBackgroundColor:[UIColor colorWithRed:194/255.0 green:194/255.0 blue:194/255.0 alpha:0.9]];
        [scrollView addSubview:topView];
        
        NSArray *titles = @[@"我的缓存",@"功能开关",@"我的投稿",@"更多应用"];
        CGFloat origionY = CGRectGetMaxY(topView.frame);
        for (int i = 0; i<titles.count; i++) {
            UIButton *funBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(topView.frame) + 80 * (i + 1), Width, 21)];
            [funBtn setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
            [funBtn.titleLabel setTextColor:[UIColor darkGrayColor]];
            [funBtn setTag:8000+i];
            [[funBtn titleLabel] setTextAlignment:NSTextAlignmentCenter];
            [funBtn setBackgroundColor:[UIColor clearColor]];
            [funBtn addTarget:self action:@selector(functionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView addSubview:funBtn];
            if (i == titles.count - 1) {
                origionY = CGRectGetMaxY(funBtn.frame);
            }
        }
        
        UILabel *notice = [[UILabel alloc] initWithFrame:CGRectMake(0, origionY + 70, Width, 60)];
        [notice setText:@"Version 1.9.1 / 豌豆荚出品"];
        [notice setTextAlignment:NSTextAlignmentCenter];
        [notice setTextColor:[UIColor darkGrayColor]];
        [scrollView addSubview:notice];
        
        [scrollView setContentSize:CGSizeMake(Width, CGRectGetMaxY(notice.frame))];
        
        UIButton *hiddenBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(scrollView.frame), Width, 48)];
        [hiddenBtn setTitle:@"hidden" forState:UIControlStateNormal];
        [hiddenBtn addTarget:self action:@selector(hidden:) forControlEvents:UIControlEventTouchUpInside];
        [hiddenBtn setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.8]];
        [hiddenBtn setTag:7000];
        [self addSubview:hiddenBtn];
    }
    return self;
}

-(void)hidden:(UIButton *)sender
{
    if (self.hiddenCallBack) {
        self.hiddenCallBack(sender.tag);
    }
}

-(void)functionBtnAction:(UIButton *)sender
{
    if (self.hiddenCallBack) {
        self.hiddenCallBack(sender.tag);
    }
}

@end
