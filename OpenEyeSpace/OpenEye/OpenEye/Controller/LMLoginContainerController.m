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
        [[loginController view] setBackgroundColor:[UIColor redColor]];
        [self setViewControllers:@[loginController]];
        [self setToolbarHidden:NO];
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"hdddd" style:UIBarButtonItemStylePlain target:self action:@selector(menuAction:)];
    self.navigationBar.topItem.leftBarButtonItem = item;
//    [self.toolbar setItems:@[item]];
    
    UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    UIBarButtonItem *two = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    UIBarButtonItem *three = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    UIBarButtonItem *four = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self setToolbarItems:[NSArray arrayWithObjects:flexItem, one, flexItem, two, flexItem, three, flexItem, four, flexItem, nil]];
}

-(void)menuAction:(UIButton *)sender
{
    if (self.hiddenCallBack) {
        self.hiddenCallBack(sender.tag);
    }
}
@end
