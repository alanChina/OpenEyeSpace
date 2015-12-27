//
//  LMNavigationController.m
//  OpenEye
//
//  Created by by on 15/12/27.
//  Copyright © 2015年 dlm. All rights reserved.
//

#import "LMNavigationController.h"
#import "LMLoginView.h"

@interface LMNavigationController ()
@property (nonatomic, strong) LMLoginView *loginView;
@property (nonatomic, assign) BOOL isShowed;
@end

@implementation LMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *menuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [menuBtn setContentMode:UIViewContentModeLeft];
    [menuBtn setImage:[UIImage imageNamed:@"btn_menu_normal"] forState:UIControlStateNormal];
    [menuBtn setImage:[UIImage imageNamed:@"btn_menu_disabled"] forState:UIControlStateHighlighted];
    [menuBtn addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    self.navigationBar.topItem.leftBarButtonItem = item;

    CGFloat height = CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.navigationBar.frame) - 20;
     self.loginView = [[LMLoginView alloc] initWithFrame:CGRectMake(0, -CGRectGetHeight(self.view.frame), CGRectGetWidth(self.view.frame), height)];
    __weak typeof(self) weakSelf = self;
    [self.loginView setHiddenCallBack:^(NSInteger tag){
        if (tag == 7000) {
            [weakSelf menuAction:nil];
        }else{
            UIViewController *controller = [[UIViewController alloc] init];
            [controller setTitle:[NSString stringWithFormat:@"%ld",(long)tag]];
            [weakSelf pushViewController:controller animated:YES];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)menuAction:(id)sender
{
    if (!self.isShowed) {
//        [self.view insertSubview:self.loginView belowSubview:self.navigationBar];
//        [self.view insertSubview:self.loginView aboveSubview:[self.viewControllers firstObject].view];
        
        [[self.topViewController view] addSubview:self.loginView];
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rect = weakSelf.loginView.frame;
            rect.origin.y = CGRectGetMaxY(weakSelf.navigationBar.frame);
            weakSelf.loginView.frame = rect;
        } completion:^(BOOL finished) {
            weakSelf.isShowed = YES;
        }];
    }else{
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rect = weakSelf.loginView.frame;
            rect.origin.y = -CGRectGetHeight(weakSelf.view.frame);
            weakSelf.loginView.frame = rect;
        } completion:^(BOOL finished) {
            weakSelf.isShowed = NO;
            [weakSelf.loginView removeFromSuperview];
        }];
    }
}

@end
