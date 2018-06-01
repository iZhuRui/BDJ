//
//  ZRADItem.h
//  BDJ
//
//  Created by edz on 2018/6/1.
//  Copyright © 2018年 edz. All rights reserved.
//

#import <Foundation/Foundation.h>
// w_picurl  ori_curl   w  h
@interface ZRADItem : NSObject
/**
 广告地址
 */
@property (nonatomic, strong) NSString *w_picurl;
/**
 跳转地址
 */
@property (nonatomic, strong) NSString *ori_curl;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;
@end
