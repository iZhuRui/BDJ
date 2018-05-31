//
//  UIView+ZRFrame.h
//  BDJ
//
//  Created by edz on 2018/5/31.
//  Copyright © 2018年 edz. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 写分类：避免与其他开发者产生冲突，加前缀
 */
@interface UIView (ZRFrame)

@property (nonatomic, assign) CGFloat zr_width;
@property (nonatomic, assign) CGFloat zr_height;
@property (nonatomic, assign) CGFloat zr_x;
@property (nonatomic, assign) CGFloat zr_y;

@end
