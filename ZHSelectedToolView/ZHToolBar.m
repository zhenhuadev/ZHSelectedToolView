//
//  ZHToolBar.m
//  ZHSelectedToolView
//
//  Created by 钟振华 on 2017/9/18.
//  Copyright © 2017年 zhenhuadev. All rights reserved.
//

#import "ZHToolBar.h"

static CGFloat const toolBarItemMargin = 15; // 标题之间的间距
static CGFloat const toolBarHeight = 44; // 顶部标签栏的高度

@interface ZHToolBar ()

@property (nonatomic, strong) NSMutableArray *buttonsArr;
@property (nonatomic, weak) UIButton *selectedBtn;

@end
@implementation ZHToolBar

- (NSMutableArray *)buttonsArr {
    
    if (!_buttonsArr) {
        
        _buttonsArr = [NSMutableArray array];
    }
    return _buttonsArr;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bounces = NO;
    }
    return self;
}

- (void)setBtnTitle:(NSString *)title {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button sizeToFit];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    [self.buttonsArr addObject:button];
}

- (void)buttonClick:(UIButton *)sender {
    
    NSInteger index = [self.buttonsArr indexOfObject:sender];
    if ([self.toolBarDelegate respondsToSelector:@selector(toolBarBtnSelectedIndex:)]) {
        
        [self.toolBarDelegate toolBarBtnSelectedIndex:index];
    }
}

- (void)setSelectedItem:(NSInteger)index {
    
    UIButton *button = self.buttonsArr[index];
    [UIView animateWithDuration:0.25 animations:^{
        
        button.selected = YES;
        button.titleLabel.font = [UIFont systemFontOfSize:18];
        self.selectedBtn.selected = NO;
        self.selectedBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.selectedBtn = button;
        
        // 计算偏移量
        CGFloat offsetX = button.center.x - ScreenW * 0.5;
        if (offsetX < 0) offsetX = 0;
        // 获取最大滚动范围
        CGFloat maxOffsetX = self.contentSize.width - ScreenW;
        if (offsetX > maxOffsetX) offsetX = maxOffsetX;
        
        if (self.contentSize.width > [UIScreen mainScreen].bounds.size.width) {
            // 滚动标题滚动条
            [self setContentOffset:CGPointMake(offsetX, 0) animated:YES];
        }
    }];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGFloat btnH = toolBarHeight;
    CGFloat btnX = toolBarItemMargin;
    for (NSInteger i = 0; i < self.buttonsArr.count; i++) {
        UIButton *button = self.buttonsArr[i];
        button.frame = CGRectMake(btnX, 0, button.frame.size.width, btnH);
        btnX += button.frame.size.width + toolBarItemMargin;
    }
    self.contentSize = CGSizeMake(btnX, 0);
}

@end
