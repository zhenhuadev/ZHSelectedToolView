//
//  ZHTabBarView.m
//  ZHSelectedToolView
//
//  Created by 钟振华 on 2017/9/18.
//  Copyright © 2017年 zhenhuadev. All rights reserved.
//

#import "ZHTabBarView.h"
#import "ZHToolBar.h"
#import "ZHRootListViewController.h"
static CGFloat const toolBarHeight = 44;

@interface  ZHTabBarView ()<UIScrollViewDelegate,ZHToolBarDelegate>

@property (nonatomic, strong) NSMutableArray *subControllersArr;
@property (nonatomic, weak) UIScrollView *pagesScrollView;
@property (nonatomic, weak) ZHToolBar *toolBar;

@end

@implementation ZHTabBarView

/**懒加载*/
- (NSMutableArray *)subControllersArr {
    
    if (!_subControllersArr) {
        
        _subControllersArr = [NSMutableArray array];
    }
    return _subControllersArr;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self createView];
    }
    return self;
}

- (void)createView {
    
    ZHToolBar *toolBar = [[ZHToolBar alloc] initWithFrame:CGRectMake(0, 0, ScreenW, toolBarHeight)];
    toolBar.backgroundColor = [UIColor orangeColor];
    toolBar.toolBarDelegate = self;
    self.toolBar = toolBar;
    [self addSubview:toolBar];

    if (!self.pagesScrollView) {
        
        UIScrollView *pagesScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, toolBarHeight, ScreenW, ScreenH - toolBarHeight - 64)];
        pagesScrollView.delegate = self;
        pagesScrollView.pagingEnabled = YES;
        pagesScrollView.showsVerticalScrollIndicator = NO;
        pagesScrollView.showsHorizontalScrollIndicator = NO;
        self.pagesScrollView = pagesScrollView;
        [self addSubview:pagesScrollView];
    }
}

- (void)addSubViewController:(UIViewController *)viewController {
    
    [self.toolBar setBtnTitle:viewController.title];
    [self.subControllersArr addObject:viewController];
    CGFloat pageY = 0;
    CGFloat pageW = self.bounds.size.width;
    CGFloat pageX = pageW;
    CGFloat pageH = CGRectGetHeight(self.pagesScrollView.frame);
    CGSize pageContentSize = CGSizeMake(pageW, pageH);
    
    for (int i = 0; i < self.subControllersArr.count; i++) {
        
        ZHRootListViewController *rootVc = [self.subControllersArr objectAtIndex:i];
        rootVc.view.frame = CGRectMake(pageX * i, pageY, pageW, pageH);
        [self.pagesScrollView addSubview:rootVc.view];
        pageContentSize.width = CGRectGetMaxX(rootVc.view.frame);
    }
    
    self.pagesScrollView.contentSize = pageContentSize;

}

#pragma mark --> UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offX = scrollView.contentOffset.x;
    CGFloat pageW = self.bounds.size.width;
    if (scrollView == self.toolBar) {
        
    } else {
        CGFloat index = offX/pageW;
        [self.toolBar setSelectedItem:index];
    }
}

#pragma mark --> toolBarDelegate
- (void)toolBarBtnSelectedIndex:(NSInteger)selectedIndex {

    self.pagesScrollView.contentOffset = CGPointMake(selectedIndex * ScreenW, 0);
}



@end
