//
//  ZRNewViewController.m
//  BDJ
//
//  Created by edz on 2018/5/30.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "ZRNewViewController.h"

@interface ZRNewViewController ()

@end

@implementation ZRNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavigationBar];
}

- (void)setupNavigationBar
{
    /*
     UIBarButtonItem 描述按钮具体的内容
     UINavigationBarItem 设置导航条上内容（左边右边中间）
     tabBarItem 设置tabBar上按钮内容（tabBarButton）
     */
    
    // 左边、右边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImagename:@"MainTagSubIcon" highlightImagename:@"MainTagSubIconClick" target:self action:@selector(sub)];
        
    // titleView
    // initWithImage好处：默认imageView尺寸跟图片一样大
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:ZRImageName(@"MainTitle")];
}

- (void)sub
{
    ZRFUNC;
}
@end
