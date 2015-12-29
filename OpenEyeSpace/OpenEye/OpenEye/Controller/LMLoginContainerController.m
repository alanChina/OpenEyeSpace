//
//  LMLoginContainerController.m
//  OpenEye
//
//  Created by by on 15/12/28.
//  Copyright © 2015年 dlm. All rights reserved.
//

#import "LMLoginContainerController.h"
#import "LMLoginController.h"

@interface LMLoginContainerController ()
@end

@implementation LMLoginContainerController

-(instancetype)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass
{
    self = [super initWithNavigationBarClass:navigationBarClass toolbarClass:toolbarClass];
    if (self) {
        LMLoginController *loginController = [[LMLoginController alloc] init];
        [self setViewControllers:@[loginController]];
        [self setToolbarHidden:NO];
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 48 - 64)];
    UIButton *hiddenBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 48 - 64, CGRectGetWidth(self.view.frame), 48)];
    [hiddenBtn setTitle:@"hidden" forState:UIControlStateNormal];
    [hiddenBtn addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
    [hiddenBtn setBackgroundColor:[UIColor redColor]];
    [hiddenBtn setTag:7000];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:hiddenBtn];
    [self.toolbar setItems:@[item]];
}

-(void)menuAction:(UIButton *)sender
{
    if (self.hiddenCallBack) {
        self.hiddenCallBack(sender.tag);
    }
}
@end
