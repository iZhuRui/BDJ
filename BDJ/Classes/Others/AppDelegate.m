//
//  AppDelegate.m
//  BDJ
//
//  Created by edz on 2018/5/30.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "AppDelegate.h"
#import "ZRTabBarController.h"

/*
 优先级：LaunchScreen > LaunchImage
 如果通过LaunchImage设置启动界面，那么屏幕的可视范围由图片决定
 如果使用LaunchImage，必须提供各个尺寸的启动图片
 
 LaunchScreen xcode6开始才有
 LaunchScreen好处：1.自动识别当前真机或者模拟器的尺寸 2.只要让美工提供一个可拉伸图片 3.展示更多东西
 
 LaunchScreen底层实现：把LaunchScreen截屏，生成一张图片，作为启动界面
 
 */

/*
 项目架构搭建：
 */

@interface AppDelegate ()

@end

@implementation AppDelegate

// 程序启动的时候就会调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2.设置窗口根控制器
    ZRTabBarController * tabBarVC = [[ZRTabBarController alloc] init];
    self.window.rootViewController = tabBarVC;
    
    //3.显示窗口  1.成为UIApplication主窗口 2.
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
