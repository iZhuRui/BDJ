//
//  ZRTabBar.m
//  BDJ
//
//  Created by edz on 2018/5/31.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "ZRTabBar.h"

@interface ZRTabBar ()

@property (nonatomic, weak) UIButton * publishBtn;

@end

@implementation ZRTabBar

-(UIButton *)publishBtn
{
    if (!_publishBtn) {
        UIButton * publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [publishBtn setBackgroundImage:ZRImageName(@"tabBar_publish_icon") forState:UIControlStateNormal];
        
        [publishBtn setBackgroundImage:ZRImageName(@"tabBar_publish_click_icon") forState:UIControlStateHighlighted];
        
        // 根据按钮图片文字自适应
        [publishBtn sizeToFit];
        
        _publishBtn = publishBtn;
        
        [self addSubview:publishBtn];
    }
    return _publishBtn;
}

// 这个方法调用频率比较高，publish按钮要保证只加一次，采用懒加载方式
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.items.count + 1;
    
    CGFloat btnW = self.zr_width / count;
    CGFloat btnH = self.zr_height;
    
    CGFloat btnX = 0;
    // 布局tabBarButton
    NSInteger i = 0;
    for (UIView * tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i +=1;
            }
            
            btnX = i * btnW;
            
            tabBarButton.frame = CGRectMake(btnX, 0, btnW, btnH);
            
            i++;
        }
    }
    
    // 设置加号按钮center
    self.publishBtn.center = CGPointMake(self.zr_width * 0.5, self.zr_height * 0.5);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
