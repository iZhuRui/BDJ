//
//  UIImage+ZRImage.m
//  BDJ
//
//  Created by edz on 2018/5/30.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "UIImage+ZRImage.h"

@implementation UIImage (ZRImage)

+ (UIImage *)imageOriginalWithName:(NSString *)imageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
