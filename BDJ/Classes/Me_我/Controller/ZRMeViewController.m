//
//  ZRMeViewController.m
//  BDJ
//
//  Created by edz on 2018/5/30.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "ZRMeViewController.h"
#import "ZRSettingViewController.h"

/*
    搭建基本结构 -> 设置底部条 -> 设置顶部条 -> 设置顶部条字体和图片 -> 设置导航控制器业务逻辑（跳转）
 */

@interface ZRMeViewController ()

@end

@implementation ZRMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    UIBarButtonItem * settingItem = [UIBarButtonItem itemWithImagename:@"mine-setting-icon" highlightImagename:@"mine-setting-icon-click" target:self action:@selector(setting)];
    
    UIBarButtonItem * nightItem = [UIBarButtonItem itemWithImagename:@"mine-moon-icon" selectImagename:@"mine-moon-icon-click" target:self action:@selector(night:)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,nightItem];
    
    // titleView
    self.navigationItem.title = @"我的";

}

- (void)setting
{
    ZRFUNC;
    ZRSettingViewController * settingVC = [[ZRSettingViewController alloc] init];
    // 必须在跳转之前设置
    [self.navigationController pushViewController:settingVC animated:YES];
    
    /*
     1底部条没有隐藏
     2处理返回按钮样式 ： 去设置控制器设置
     */
}

- (void)night:(UIButton *)sender
{
    sender.selected = !sender.selected;
    ZRFUNC;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
