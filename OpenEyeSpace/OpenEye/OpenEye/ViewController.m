//
//  ViewController.m
//  OpenEye
//
//  Created by by on 15/12/25.
//  Copyright © 2015年 dlm. All rights reserved.
//

#import "ViewController.h"
#import "LMLoginContainerController.h"
#import "LMToolBar.h"

@interface ViewController (){
    
    LMLoginContainerController *nav2;
    UINavigationController *nav1;
}
@property (nonatomic, assign) BOOL isShowed;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor purpleColor]];
    [self.view.window setBackgroundColor:[UIColor redColor]];
    
    UIButton *menuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [menuBtn setContentMode:UIViewContentModeLeft];
    [menuBtn setImage:[UIImage imageNamed:@"btn_menu_normal"] forState:UIControlStateNormal];
    [menuBtn setImage:[UIImage imageNamed:@"btn_menu_disabled"] forState:UIControlStateHighlighted];
    [menuBtn addTarget:self action:@selector(leftMenuAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
    UIViewController *c1 = [[UIViewController alloc] init];
    UIButton *menuBtn0 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 60, 44)];
    [menuBtn0 setContentMode:UIViewContentModeLeft];
    [menuBtn0 setImage:[UIImage imageNamed:@"btn_menu_normal"] forState:UIControlStateNormal];
    [menuBtn0 setImage:[UIImage imageNamed:@"btn_menu_disabled"] forState:UIControlStateHighlighted];
    [menuBtn0 addTarget:self action:@selector(lAction:) forControlEvents:UIControlEventTouchUpInside];
    [[c1 view] addSubview:menuBtn0];
    
    [[c1 view] setBackgroundColor:[UIColor purpleColor]];
    nav1 = [[UINavigationController alloc] initWithRootViewController:c1];
    [self addChildViewController:nav1];
    [nav1.view setFrame:self.view.frame];
    [self.containerView addSubview:nav1.view];
    [nav1 didMoveToParentViewController:self];
    c1.navigationItem.leftBarButtonItem = leftItem;
    
    nav2 = [[LMLoginContainerController alloc] initWithNavigationBarClass:nil toolbarClass:[LMToolBar class]];
    __weak typeof(self) weakSelf = self;
    [nav2 setHiddenCallBack:^(NSInteger btnTag){
        [weakSelf leftMenuAction:nil];
    }];
    [self addChildViewController:nav2];
    [nav2.view setFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds),0)];
    [self.containerView addSubview:nav2.view];
    [nav2 didMoveToParentViewController:self];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

-(void)leftMenuAction:(id)sender
{
    __weak typeof(self) weakSelf = self;
    if (!self.isShowed) {
        [UIView animateWithDuration:0.5 animations:^{
            [nav2.view setFrame:[UIScreen mainScreen].bounds];
        } completion:^(BOOL finished) {
            weakSelf.isShowed = YES;
        }];
        
    }else{
        [UIView animateWithDuration:0.5 animations:^{
        } completion:^(BOOL finished) {
            weakSelf.isShowed = NO;
        }];
    }
    
}

-(void)lAction:(id)sender
{
    UIViewController *v = [UIViewController new];
    [[v view] setBackgroundColor:[UIColor redColor]];
    [nav1 pushViewController:v animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
