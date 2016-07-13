//
//  SNViewController.m
//  BSDSocket
//
//  Created by 普伴 on 16/7/13.
//  Copyright © 2016年 Puban. All rights reserved.
//

#import "SNViewController.h"
#import "SNClentViewController.h"
#import "SNServerViewController.h"
@interface SNViewController ()

@end

@implementation SNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SNServerViewController *server = [[SNServerViewController alloc] init];
    [self addOneChlildVc:server title:@"服务器" imageName:nil selectedImageName:nil];
    
    SNClentViewController *clent = [[SNClentViewController alloc] init];
    [self addOneChlildVc:clent title:@"客户端" imageName:nil selectedImageName:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
   
}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVc.tabBarItem.selectedImage = selectedImage;
    
    
    [self addChildViewController:childVc];
    
    
}

@end
