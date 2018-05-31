//
//  UIView+ZRFrame.m
//  BDJ
//
//  Created by edz on 2018/5/31.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "UIView+ZRFrame.h"

@implementation UIView (ZRFrame)

-(void)setZr_width:(CGFloat)zr_width
{
    CGRect rect = self.frame;
    rect.size.width = zr_width;
    self.frame = rect;
}

-(CGFloat)zr_width
{
    return self.frame.size.width;
}

-(void)setZr_height:(CGFloat)zr_height
{
    CGRect rect = self.frame;
    rect.size.height = zr_height;
    self.frame = rect;
}

-(CGFloat)zr_height
{
    return self.frame.size.height;
}

-(void)setZr_x:(CGFloat)zr_x
{
    CGRect rect = self.frame;
    rect.origin.x = zr_x;
    self.frame = rect;
}

-(CGFloat)zr_x
{
    return self.frame.origin.x;
}

-(void)setZr_y:(CGFloat)zr_y
{
    CGRect rect = self.frame;
    rect.origin.y = zr_y;
    self.frame = rect;
}

-(CGFloat)zr_y
{
    return self.frame.origin.y;
}

@end
