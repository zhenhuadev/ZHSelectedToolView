//
//  ViewController.m
//  ZHSelectedToolView
//
//  Created by 钟振华 on 2017/9/18.
//  Copyright © 2017年 zhenhuadev. All rights reserved.
//

#import "ViewController.h"
#import "ZHTabBarView.h"
#import "TextViewController.h"
@interface ViewController ()

@property (nonatomic, weak) ZHTabBarView *tabBarView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"标签栏";
}

- (void)createView {
    
    if (!self.tabBarView) {
        
        ZHTabBarView *tabBar = [[ZHTabBarView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
        [self.view addSubview:tabBar];

        TextViewController * vc0 = [[TextViewController alloc] init];
        vc0.title = @"推荐";
        [tabBar addSubViewController:vc0];
        
        TextViewController * vc1 = [[TextViewController alloc]init];
        vc1.title = @"热点";
        [tabBar addSubViewController:vc1];
        
        TextViewController * vc2 = [[TextViewController alloc]init];
        vc2.title = @"中国好声音";
        [tabBar addSubViewController:vc2];

        
        TextViewController * vc3 = [[TextViewController alloc]init];
        vc3.title = @"中国好声音";
        [tabBar addSubViewController:vc3];

        
        TextViewController * vc4 = [[TextViewController alloc]init];
        vc4.title = @"中国好声音";
        [tabBar addSubViewController:vc4];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
