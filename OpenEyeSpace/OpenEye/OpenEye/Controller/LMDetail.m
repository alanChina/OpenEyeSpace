//
//  LMDetail.m
//  OpenEye
//
//  Created by by on 16/1/9.
//  Copyright © 2016年 dlm. All rights reserved.
//

#import "LMDetail.h"
#import "LMHome.h"
#import "Transition.h"

@interface LMDetail ()<UINavigationControllerDelegate>

@end

@implementation LMDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if (fromVC == self && [toVC isKindOfClass:[LMHome class]]) {
        return [[PopTransition alloc] init];
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
