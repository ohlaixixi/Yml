//
//  LXBaseTabBarController.m
//  Yml
//
//  Created by 希 on 2017/6/12.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXBaseTabBarController.h"
#import "LXBaseNavigationController.h"
#import "LXHomeController.h"
#import "LXCategoryController.h"
#import "LXCommunityController.h"
#import "LXMyController.h"

@interface LXBaseTabBarController ()

@end

@implementation LXBaseTabBarController

+ (void)initialize {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    attrs[NSForegroundColorAttributeName] = UIColorFromHex(0x9f9f9f);
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = GLOBAL_COLOR;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildViewController:[[LXHomeController alloc]init] withTitle:@"首页" withImage:@"home" withSelectedImage:@"homes"];
    [self setupChildViewController:[[LXCategoryController alloc]init] withTitle:@"项目" withImage:@"category" withSelectedImage:@"categorys"];
    [self setupChildViewController:[[LXCommunityController alloc]init] withTitle:@"美圈" withImage:@"community" withSelectedImage:@"communitys"];
    [self setupChildViewController:[[LXMyController alloc]init] withTitle:@"我的" withImage:@"my" withSelectedImage:@"mys"];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    self.tabBar.backgroundColor = [UIColor whiteColor];
}

- (void)setupChildViewController:(UIViewController *)vc withTitle:(NSString *)title withImage:(NSString *)image withSelectedImage:(NSString *)selectImage {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    LXBaseNavigationController *navController = [[LXBaseNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:navController];
}
@end