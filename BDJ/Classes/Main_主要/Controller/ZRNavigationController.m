//
//  ZRNavigationController.m
//  BDJ
//
//  Created by edz on 2018/5/31.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "ZRNavigationController.h"

@interface ZRNavigationController ()

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
