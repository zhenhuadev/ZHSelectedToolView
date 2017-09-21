//
//  ZHToolBar.h
//  ZHSelectedToolView
//
//  Created by 钟振华 on 2017/9/18.
//  Copyright © 2017年 zhenhuadev. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@protocol ZHToolBarDelegate <NSObject>

- (void)toolBarBtnSelectedIndex:(NSInteger)selectedIndex;

@end
@interface ZHToolBar : UIScrollView

- (void)setBtnTitle:(NSString *)title;

- (void)setSelectedItem:(NSInteger)index;

@property (nonatomic, assign) id<ZHToolBarDelegate>toolBarDelegate;

@end
