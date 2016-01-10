//
//  LMRoot.m
//  OpenEye
//
//  Created by by on 16/1/1.
//  Copyright © 2016年 dlm. All rights reserved.
//

#import "LMRoot.h"
#import "LMLeftItemAction.h"
@interface LMRoot ()<LMLeftItemAction>

@property (weak, nonatomic) IBOutlet UIView *uContainer;
@property (weak, nonatomic) IBOutlet UIView *homeContainer;
@property (nonatomic, strong) NSLayoutConstraint *bottomConstraint;
@property (nonatomic, assign) BOOL isShowed;

@end

@implementation LMRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSLayoutConstraint *constaint in self.view.constraints) {
        if ([@"uContainerBottomIdentifer" isEqualToString:constaint.identifier]) {
            constaint.constant = -(CGRectGetHeight([UIScreen mainScreen].applicationFrame)-65);
            [self.view layoutIfNeeded];
            self.bottomConstraint = constaint;
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)leftMenuAction:(id)sender
{
    __weak typeof(self) weakSelf = self;
    if (!self.isShowed) {
        [self.view bringSubviewToFront:self.uContainer];
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.bottomConstraint.constant = 0;
            [weakSelf.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            weakSelf.isShowed = YES;
        }];
        
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.bottomConstraint.constant = -CGRectGetHeight([UIScreen mainScreen].applicationFrame);
            [weakSelf.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            [weakSelf.view sendSubviewToBack:weakSelf.uContainer];
            weakSelf.isShowed = NO;
        }];
    }
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
