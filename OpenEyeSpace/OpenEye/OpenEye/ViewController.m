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
    UIWindow *normalWindow;
    UIBarButtonItem *leftItem;
}
@property (nonatomic, assign) BOOL isShowed;
@property (nonatomic, strong) LMLoginContainerController *lmLoginContainer;

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
    leftItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"login" style:UIBarButtonItemStylePlain target:self action:@selector(rightMenuAction:)];
    self.navigationItem.rightBarButtonItem = item;
    
    _lmLoginContainer = [[LMLoginContainerController alloc] initWithNavigationBarClass:nil toolbarClass:[LMToolBar class]];
    __weak typeof(self) weakSelf = self;
    [_lmLoginContainer setHiddenCallBack:^(NSInteger btnTag){
        [weakSelf leftMenuAction:nil];
    }];
    normalWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetMaxY(self.navigationController.navigationBar.frame))];
    normalWindow.backgroundColor = [UIColor blueColor];
    normalWindow.windowLevel = UIWindowLevelNormal;
    _lmLoginContainer.viewControllers.firstObject.navigationItem.leftBarButtonItem = leftItem;
    [normalWindow setRootViewController:_lmLoginContainer];
    [normalWindow makeKeyAndVisible];
    [normalWindow setHidden:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.leftBarButtonItem = leftItem;
}

-(void)leftMenuAction:(id)sender
{
    __weak typeof(self) weakSelf = self;
    if (!self.isShowed) {
        [normalWindow setHidden:NO];
        [UIView animateWithDuration:0.5 animations:^{
            [normalWindow setFrame:[UIScreen mainScreen].bounds];
        } completion:^(BOOL finished) {
            weakSelf.isShowed = YES;
        }];
        
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            [normalWindow setFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetMaxY(self.navigationController.navigationBar.frame))];
        } completion:^(BOOL finished) {
            [normalWindow setHidden:YES];
            weakSelf.isShowed = NO;
        }];
    }
    
//    if (!self.isShowed) {
//        __weak typeof(self) weakSelf = self;
//        
//        [UIView animateWithDuration:0.5 animations:^{
//            CGRect rect = weakSelf.lmLoginContainer.view.frame;
//            rect.origin.y = 0;
//            weakSelf.lmLoginContainer.view.frame = rect;
//        } completion:^(BOOL finished) {
//            weakSelf.isShowed = YES;
//        }];
//    }else{
//        __weak typeof(self) weakSelf = self;
//        [UIView animateWithDuration:0.5 animations:^{
//            CGRect rect = weakSelf.lmLoginContainer.view.frame;
//            rect.origin.y = -CGRectGetHeight(weakSelf.view.frame);
//            weakSelf.lmLoginContainer.view.frame = rect;
//        } completion:^(BOOL finished) {
//            weakSelf.isShowed = NO;
////            [weakSelf.lmLoginContainer willMoveToParentViewController:nil];
////            [weakSelf.lmLoginContainer.view removeFromSuperview];
////            [weakSelf.lmLoginContainer removeFromParentViewController];
//        }];
//    }
}

-(void)rightMenuAction:(id)sender
{
    UIViewController *cons = [UIViewController new];
    [[cons view] setBackgroundColor:[UIColor grayColor]];
    [self.navigationController pushViewController:cons animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
