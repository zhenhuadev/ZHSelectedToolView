//
//  TextViewController.m
//  ZHSelectedToolView
//
//  Created by 钟振华 on 2017/9/18.
//  Copyright © 2017年 zhenhuadev. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.8];
    // Do any additional setup after loading the view.
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
