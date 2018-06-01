//
//  ZRADViewController.m
//  BDJ
//
//  Created by edz on 2018/6/1.
//  Copyright © 2018年 edz. All rights reserved.
//

#import "ZRADViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "ZRADItem.h"
#import <MJExtension/MJExtension.h>
#import <UIImageView+WebCache.h>

#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface ZRADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, weak) UIImageView * adView;
@property (nonatomic, strong) ZRADItem * item;
@end

@implementation ZRADViewController

/*
 1.添加东西，首先想到加多少次，一般加一次使用懒加载
 */
- (UIImageView *)adView
{
    if (!_adView) {
        UIImageView * imageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:imageView];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        
        imageView.userInteractionEnabled = YES;
        
        [imageView addGestureRecognizer:tap];
        
        _adView = imageView;
    }
    return _adView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置启动图片
    [self setupLaunchImage];
    
    // 加载广告数据 -> 拿到活数据 -> 服务器 -> 查看接口文档 1.判断接口对不对 2.解析数据 -> 请求数据
    
    /*
     cocoapods:管理第三方库，cocoapods做的事情：导入一个框架，会把这个框架依赖的所有框架都导入
     cocoapods步骤： podfile：描述需要导入哪些框架
     
     Force running `pod repo update` before
     Podfile.lock: 第一次pod 就会自动生成这个文件，描述当前导入框架版本
     pod install:根据Podfile.lock去加载，第一次会根据podfile文件加载
     pod update:去查看之前导入框架有没有新的版本，如果有新的版本就会去加载，并且更新podfile.lock
     pod repo:管理第三方仓库的索引，去寻找框架有没有最新的版本，有就记录
     */
    
    // 加载广告数据
    [self setupADData];
}

// 设置启动图片
- (void)setupLaunchImage
{
    // 屏幕适配
    if (iPhone6P) {//6p
        self.launchImageView.image = ZRImageName(@"LaunchImage-800-Portrait-736h@3x");
    }else if (iPhone6) {//6
        self.launchImageView.image = ZRImageName(@"LaunchImage-800-667h@2x");
    }else if (iPhone5) {//5
        self.launchImageView.image = ZRImageName(@"LaunchImage-568h@2x");
    }else if (iPhone4) {//4
        self.launchImageView.image = ZRImageName(@"LaunchImage-700@2x");
    }
    
    // Assets作用：防止应用程序内图片被盗用，放在Assets里会被压缩，不能通过IPA包获取到
}

/*
 http://mobads.baidu.com/cpro/ui/mads.php?code2=phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam
 */

/*
 警告
 Block implicitly retains 'self'; explicitly mention 'self' to indicate this is intended behavior
 
 消除
 Building Settings
 
 CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF=NO
 */

- (void)setupADData
{
    // unacceptable content-type: text/html   响应头
    /*
     客户端->服务器  请求
     请求：请求头+请求体
     请求头：告诉服务器，客户端支持哪些格式，json、html
     请求体：post请求才有，把参数封装到请求体中
     
     服务器->客户端  响应
     响应：响应头+响应体
     响应头：content-type描述服务器给你数据的格式
     响应体：数据放在响应体里
     */
    
    // 1.创建请求会话管理者
    AFHTTPSessionManager * mgr = [AFHTTPSessionManager manager];
    
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    // 2.拼接参数
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    
    // 3.发送请求
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 请求数据 -> 解析数据（写成plist文件） -> 设计模型 -> 字典转模型 -> 展示数据
        ZRLog(@"success--%@",responseObject);
        
        // 获取字典
        NSDictionary * adDict = [responseObject[@"ad"] lastObject];
        
        // 字典转模型
        _item = [ZRADItem mj_objectWithKeyValues:adDict];
        
        // 创建UIImageView展示图片
        CGFloat h = ZRScreenW / _item.w * _item.h;
        
        self.adView.frame = CGRectMake(0, 0, ZRScreenW, h);
        
        [self.adView sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ZRLog(@"error--%@",error);
    }];
    
}

// 点击广告界面调用
- (void)tap
{
    // 跳转到界面 -> Safari
    NSURL * url = [NSURL URLWithString:_item.ori_curl];
    UIApplication * application = [UIApplication sharedApplication];
    if ([application canOpenURL:url]) {
        [application openURL:url];
    }
    ZRFUNC;
}

@end
