//
//  NavViewController.m
//  微博个人详情页
//
//  Created by Rick on 15/8/25.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "NavViewController.h"
#import "ViewController.h"
#import "UIImage+Utils.h"

@interface NavViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    // 获取系统自带滑动手势的target对象
    id target = self.interactivePopGestureRecognizer.delegate;
//
    self.delegate = self;
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    // 设置手势代理，拦截手势触发
    pan.delegate = self;
    
    // 给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:pan];
    
    // 禁止使用系统自带的滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

// 什么时候调用：每次触发手势之前都会询问下代理，是否触发。
// 作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    return YES;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([viewController isKindOfClass:[ViewController class]]) {

    }else{
        UIImage *image = [UIImage imageWithColor:[UIColor orangeColor]];
        [navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        // 隐藏底部阴影条，传递一个空图片的UIImage对象
        [navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    }
    
}

@end
