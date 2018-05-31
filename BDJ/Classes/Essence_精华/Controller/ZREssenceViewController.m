//
//  ZREssenceViewController.m
//  BDJ
//
//  Created by edz on 2018/5/30.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "ZREssenceViewController.h"

@interface ZREssenceViewController ()

@end

@implementation ZREssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置导航条
    [self setupNavigationBar];
    
    
    ZRFUNC;
    
}

- (void)setupNavigationBar
{
    
    /*
     UIBarButtonItem 描述按钮具体的内容
     UINavigationBarItem 设置导航条上内容（左边右边中间）
     tabBarItem 设置tabBar上按钮内容（tabBarButton）
     */
    
    // 左边、右边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImagename:@"nav_item_game_icon" highlightImagename:@"nav_item_game_click_icon" target:self action:@selector(game)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImagename:@"navigationButtonRandom" highlightImagename:@"navigationButtonRandomClick" target:self action:@selector(random)];
    
    // titleView
    // initWithImage好处：默认imageView尺寸跟图片一样大
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:ZRImageName(@"MainTitle")];
}

- (void)game
{
    ZRFUNC;
}

- (void)random
{
    ZRFUNC;
}

@end
