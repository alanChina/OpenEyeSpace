//
//  LMBaseTable.m
//  OpenEye
//
//  Created by by on 16/1/9.
//  Copyright © 2016年 dlm. All rights reserved.
//

#import "LMBaseTable.h"
#import "LMLeftItemAction.h"

@interface LMBaseTable ()

@end

@implementation LMBaseTable

-(void)viewDidLoad
{
    [super viewDidLoad];
    if (self.navigationController.viewControllers.firstObject == self) {
        UIButton *menuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
        [menuBtn setContentMode:UIViewContentModeLeft];
        [menuBtn setImage:[UIImage imageNamed:@"btn_menu_normal"] forState:UIControlStateNormal];
        [menuBtn setImage:[UIImage imageNamed:@"btn_menu_disabled"] forState:UIControlStateHighlighted];
        [menuBtn addTarget:self.view.window.rootViewController action:@selector(leftMenuAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    
    UIButton *bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 65)];
    [bottomBtn setTitle:@"收取" forState:UIControlStateNormal];
    [bottomBtn addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:bottomBtn];
    [self setToolbarItems:@[item] animated:YES];
}

-(void)menuAction:(id)sender
{
    [self.view.window.rootViewController performSelector:@selector(leftMenuAction:) withObject:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
