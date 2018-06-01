//
//  ZRNavigationController.m
//  BDJ
//
//  Created by edz on 2018/5/31.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "ZRNavigationController.h"

@interface ZRNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation ZRNavigationController

+ (void)load
{
    UINavigationBar * bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    // 只要是通过模型设置，都是通过富文本设置
    // 设置导航条属性 -> UINavigationBar
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20.0];
    [bar setTitleTextAttributes:attrs];
    
    // 设置导航条背景图片
    // 必须要用UIBarMetricsDefault
    [bar setBackgroundImage:ZRImageName(@"navigationbarBackgroundWhite") forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 假死状态，程序还在运行，但是界面死了
    
    // 控制手势什么时候触发，只有非根控制器的时候触发
//    self.interactivePopGestureRecognizer.delegate = self;
    
    // 为什么导航控制器手势不是全屏滑动
    
    // 全屏手势
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    [self.view addGestureRecognizer:pan];
    
    // 控制手势什么时候触发，只有非根控制器的时候触发
    pan.delegate = self;
    
    // 禁止之前的手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    ZRFUNC;
    
    if (self.childViewControllers.count > 0) {
        
        // 恢复滑动返回功能 -> 分析：把系统的返回按钮覆盖 -> 1.手势失效（1.手势被清空 2.可能手势代理做了其他事，导致失效）
        
        // 设置返回按钮，只有非根控制器
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImagename:@"navigationButtonReturn" highlightImagename:@"navigationButtonReturnClick" target:self action:@selector(back) title:@"返回"];
    }
    
    // 真正的在跳转
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

// 决定是否触发手势
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count > 1;
}
/*
 
 <_UINavigationInteractiveTransition 0x11be11480>手势代理
 
 UIScreenEdgePanGestureRecognizer:导航滑动手势
 target:<_UINavigationInteractiveTransition 0x11be11480>
 action:handleNavigationTransition
 
 <UIScreenEdgePanGestureRecognizer: 0x11be11970; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x11be10840>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x11be11480>)>>
 */

@end
