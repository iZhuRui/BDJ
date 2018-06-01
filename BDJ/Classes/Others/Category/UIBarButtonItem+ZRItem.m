//
//  UIBarButtonItem+ZRItem.m
//  BDJ
//
//  Created by edz on 2018/5/31.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "UIBarButtonItem+ZRItem.h"

@implementation UIBarButtonItem (ZRItem)
+ (UIBarButtonItem *)itemWithImagename:(NSString *)imageName highlightImagename:(NSString *)highlightImagename target:(id)target action:(SEL)action
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightImagename] forState:UIControlStateHighlighted];
    [btn sizeToFit];//设置按钮跟图片一样大
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView * containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    
    //把UIButton包装成UIBarButtonItem就会导致按钮点击区域扩大
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

+ (UIBarButtonItem *)itemWithImagename:(NSString *)imageName selectImagename:(NSString *)selectImagename target:(id)target action:(SEL)action
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectImagename] forState:UIControlStateSelected];
    [btn sizeToFit];//设置按钮跟图片一样大
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView * containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    
    //把UIButton包装成UIBarButtonItem就会导致按钮点击区域扩大
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

+ (UIBarButtonItem *)backItemWithImagename:(NSString *)imageName highlightImagename:(NSString *)highlightImagename target:(id)target action:(SEL)action title:(NSString *)title
{
    // 设置导航条左边按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:title forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backBtn setImage:ZRImageName(highlightImagename) forState:UIControlStateHighlighted];
    [backBtn setImage:ZRImageName(imageName) forState:UIControlStateNormal];
    [backBtn sizeToFit];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    
    return [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

@end
