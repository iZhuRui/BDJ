//
//  ZRTabBarController.m
//  BDJ
//
//  Created by edz on 2018/5/30.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "ZRTabBarController.h"
#import "ZREssenceViewController.h"
#import "ZRNewViewController.h"
#import "ZRFriendTrendViewController.h"
#import "ZRMeViewController.h"
#import "ZRPublishViewController.h"
#import "UIImage+ZRImage.h"
#import "ZRTabBar.h"
#import "ZRNavigationController.h"

@interface ZRTabBarController ()

@end

@implementation ZRTabBarController

/*
 1.选中按钮的图片被渲染 -> iOS7之后默认tabBar上的图片都会被渲染 -> 解决方法：1.修改图片 2.通过代码
 2.选中按钮的标题颜色 字体过大 -> 对应子控制器的tabBarItem
 3.发布按钮显示不出来 -> 发布按钮太大，导致显示不出来 ->
                  -> 图片太大超出tabBar，修改按钮位置 -> tabBar上按钮位置由系统决定，自己不能决定
                  -> 系统的tabBarButton没有提供高亮图片状态，因此做不了示例程序效果
                  -> 加号按钮应该是普通按钮，才有高亮状态 -> 发布控制器不是tabBarController的子控制器
 4.最终方案：调整系统tabBar上按钮位置，平均分成五等分，把加号按钮放中间
 调整系统自带控件的子控件的位置 -> 自定义tabBar -> 使用tabBar
 研究系统的tabBarButton什么时候添加到self.tabBar上 -> viewWillAppear的时候
 */

// 只会调用一次
+ (void)load
{
    /*
     appearance:
     1.只要遵守了UIAppearance协议，还要实现这个方法
     2.哪些属性可以通过appearance设置 -> 只有被UI_APPEARANCE_SELECTOR宏修饰的属性，才能设置
     
     appearance只能在控件显示之前设置，才有作用
     夜间模式
     */
    
    // 获取整个应用程序下的UITabBarItem
//    UITabBarItem * item = [UITabBarItem appearance];
    
    // 获取哪个类中的UITabBarItem
    UITabBarItem * item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    // 设置按钮选中标题的颜色 -> 富文本：描述一个文字颜色，字体，阴影，空心，图文混排
    // 创建一个描述文本属性的字典
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体尺寸：只有设置正常状态下，才会有效果
    NSMutableDictionary * attrsFont = [NSMutableDictionary dictionary];
    attrsFont[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsFont forState:UIControlStateNormal];
}

// 注意：可能调用多次
//+ (void)initialize
//{
//    if (self == [ZRTabBarController class]) {
//
//    }
//}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//
//    NSLog(@"%@",self.tabBar.subviews);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //2.1添加子控制器（五个子控制器） -> 自定义控制器  划分项目文件结构
    [self setupChildViewController];
    
    // 2.2设置tabBar上按钮内容 -> 由对应的子控制器的tabBarItem属性
    [self setuptabBarButtons];
    
    [self setuptabBar];
}

- (void)setupChildViewController
{
    // initWithRootViewController就会调用pushViewController:(UIViewController *)viewController animated:(BOOL)animated
    
    // 精华
    ZREssenceViewController * essenceVC = [[ZREssenceViewController alloc] init];
    ZRNavigationController * nav1 = [[ZRNavigationController alloc] initWithRootViewController:essenceVC];
    [self addChildViewController:nav1];
    
    // 新帖
    ZRNewViewController * newVC = [[ZRNewViewController alloc] init];
    ZRNavigationController * nav2 = [[ZRNavigationController alloc] initWithRootViewController:newVC];
    [self addChildViewController:nav2];
    
    // 发布
    // 发布按钮不是tabBarButton，ZRPublishViewController没有必有成为tabBarController子控制器
//    ZRPublishViewController * publishVC = [[ZRPublishViewController alloc] init];
//    [self addChildViewController:publishVC];
    
    // 关注
    ZRFriendTrendViewController * friendTrendVC = [[ZRFriendTrendViewController alloc] init];
    ZRNavigationController * nav3 = [[ZRNavigationController alloc] initWithRootViewController:friendTrendVC];
    [self addChildViewController:nav3];
    
    // 我
    ZRMeViewController * meVC = [[ZRMeViewController alloc] init];
    ZRNavigationController * nav4 = [[ZRNavigationController alloc] initWithRootViewController:meVC];
    [self addChildViewController:nav4];
}

- (void)setuptabBarButtons
{
    
    // 0:nav1
    ZRNavigationController * nav1 = self.childViewControllers[0];
    nav1.tabBarItem.title = @"精华";
    nav1.tabBarItem.image = ZRImageName(@"tabBar_essence_icon");
    nav1.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    
    // 1:nav2
    ZRNavigationController * nav2 = self.childViewControllers[1];
    nav2.tabBarItem.title = @"新帖";
    nav2.tabBarItem.image = ZRImageName(@"tabBar_new_icon");
    nav2.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
    
    // 2:publish
//    publishVC.tabBarItem.image = [UIImage imageOriginalWithName:@"tabBar_publish_icon"];
//    publishVC.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_publish_click_icon"];
//    // 设置图片位置
//    publishVC.tabBarItem.imageInsets = UIEdgeInsetsMake(7, 0, -7, 0);
    
    // 3:nav3
    ZRNavigationController * nav3 = self.childViewControllers[2];
    nav3.tabBarItem.title = @"关注";
    nav3.tabBarItem.image = ZRImageName(@"tabBar_friendTrends_icon");
    nav3.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
    
    // 4:nav4
    ZRNavigationController * nav4 = self.childViewControllers[3];
    nav4.tabBarItem.title = @"我";
    nav4.tabBarItem.image = ZRImageName(@"tabBar_me_icon");
    nav4.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_me_click_icon"];
}

- (void)setuptabBar
{
    ZRTabBar * tabBar = [[ZRTabBar alloc] init];
    
    // @property(nonatomic,readonly) UITabBar *tabBar
    // .tabBar生成set方法，不能设置readonly的UITabBar，能使用KVC和runtime
    [self setValue:tabBar forKeyPath:@"tabBar"];
    // 通过访问属性赋值，不是通过set方法
    
}

@end
