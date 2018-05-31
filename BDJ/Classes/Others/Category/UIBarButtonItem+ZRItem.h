//
//  UIBarButtonItem+ZRItem.h
//  BDJ
//
//  Created by edz on 2018/5/31.
//  Copyright © 2018年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZRItem)

// 快速创建UIBarButtonItem的方法
+ (UIBarButtonItem *)itemWithImagename:(NSString *)imageName highlightImagename:(NSString *)highlightImagename target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithImagename:(NSString *)imageName selectImagename:(NSString *)selectImagename target:(id)target action:(SEL)action;

@end
