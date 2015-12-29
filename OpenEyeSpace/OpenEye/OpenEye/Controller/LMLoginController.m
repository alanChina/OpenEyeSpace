//
//  LMLoginController.m
//  OpenEye
//
//  Created by by on 15/12/28.
//  Copyright © 2015年 dlm. All rights reserved.
//

#import "LMLoginController.h"

#define Width CGRectGetWidth(self.view.frame)

@interface LMLoginController ()

@end

@implementation LMLoginController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:0.8]];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Width, CGRectGetHeight(self.view.frame))];
    [scrollView setScrollEnabled:YES];
    [scrollView setUserInteractionEnabled:YES];
    [scrollView setBounces:YES];
    [scrollView setShowsVerticalScrollIndicator:YES];
    [self.view addSubview:scrollView];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 230)];
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
}

-(void)functionBtnAction:(UIButton *)sender
{
    UIViewController *viewContro = [UIViewController new];
    [viewContro setTitle:@"hahhaha"];
    [[viewContro view] setBackgroundColor:[UIColor yellowColor]];
    [self.navigationController pushViewController:viewContro animated:YES];
}

@end
