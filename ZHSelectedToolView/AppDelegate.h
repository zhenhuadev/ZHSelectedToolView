//
//  AppDelegate.h
//  ZHSelectedToolView
//
//  Created by 钟振华 on 2017/9/18.
//  Copyright © 2017年 zhenhuadev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

