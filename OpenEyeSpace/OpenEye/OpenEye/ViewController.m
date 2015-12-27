//
//  ViewController.m
//  OpenEye
//
//  Created by by on 15/12/25.
//  Copyright © 2015年 dlm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor greenColor]];
//    UIImage *image = [UIImage imageNamed:@"LaunchImage-700"];
//    NSData *data = UIImagePNGRepresentation(image);
//    NSLog(@"data === > %@",data);
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"login" style:UIBarButtonItemStylePlain target:self action:@selector(action:)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)action:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
