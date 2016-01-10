//
//  LMHome.m
//  OpenEye
//
//  Created by by on 16/1/1.
//  Copyright © 2016年 dlm. All rights reserved.
//

#import "LMHome.h"
#import "LMUCenter.h"
#import "LMLeftItemAction.h"
#import "LMDetail.h"
#import "Transition.h"

@interface LMHome ()<UINavigationControllerDelegate>
@property (nonatomic, strong) LMUCenter *uCenter;

@end

@implementation LMHome

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    UIButton *menuBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [menuBtn setContentMode:UIViewContentModeLeft];
    [menuBtn setImage:[UIImage imageNamed:@"btn_menu_normal"] forState:UIControlStateNormal];
    [menuBtn setImage:[UIImage imageNamed:@"btn_menu_disabled"] forState:UIControlStateHighlighted];
    [menuBtn addTarget:self.view.window.rootViewController action:@selector(leftMenuAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, 60, 44)];
    [btn setContentMode:UIViewContentModeLeft];
    [btn addTarget:self.view.window.rootViewController action:@selector(leftMenuAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

-(void)leftMenuAction:(id)sender{
    UIViewController *viewContro = [UIViewController new];
    [viewContro setTitle:@"33333"];
    [[viewContro view] setBackgroundColor:[UIColor purpleColor]];
    [self.navigationController pushViewController:viewContro animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeTableCell" forIndexPath:indexPath];
    UIImageView *imageView = [cell viewWithTag:200];
    [imageView setImage:[UIImage imageNamed:@"thing01.jpg"]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 260;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if (fromVC == self && [toVC isKindOfClass:[LMDetail class]]) {
        return [[PushTransition alloc] init];
    }
    return nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)unwindToHome:(UIStoryboardSegue *)segue
{
    
}

-(UITableViewCell *)obtainTabelCell
{
    return [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

@end
