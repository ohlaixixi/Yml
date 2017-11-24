//
//  LXHomeController.m
//  Yml
//
//  Created by 希 on 2017/6/12.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXHomeController.h"
#import "LXCommunityController.h"
#import "LXAlertView.h"
#import "HUDTool.h"
#import <ImageIO/ImageIO.h>
#import "LXProductDetailController.h"
#import "UIViewController+KNSemiModal.h"

#define kUserInfo @"kUserInfo"

@interface LXHomeController ()

@end

@implementation LXHomeController

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.showReloadBtn = YES;
    self.title = @"测试";
    NSDictionary *params = @{@"uid":@"",
                             @"token":@""};
    [PublicTools setData:params toUserDefaultsKey:kUserInfo];
    
    [[NetworkTool sharedNetworkTool] POST:@"?method=msg.readNum" parameters:nil success:^(id data) {
        MLog(@"%@",data);
    } failure:^(NSError *error) {
        MLog(@"==>%@",error);
    }];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, 100, 100);
    [button setTitle:@"跳转商品详情页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(push)];

}

- (void)loadData {
    if ([NetworkTool checkNetwork]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.hiddenNetworkErrorView = YES;
        });
    }
}

- (void)buttonClick {
    [self.navigationController pushViewController:[[LXProductDetailController alloc] init] animated:YES];
//    [HUDTool showMessage:@"弹弹弹弹弹" toView:self.view];
}

- (void)push {
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:cancelAction];
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
    
//    LXAlertView *alertView = [LXAlertView alertViewWithTitle:nil message:@"文本" buttonTitles:@[@"取消",@"确定"] handler:^(LXAlertView *alertView, NSInteger buttonIndex) {
//        if (buttonIndex == 1) {
//            [self.navigationController pushViewController:[[LXCommunityController alloc] init] animated:YES];
//        }
//    }];
//    [alertView show];
    
    [HUDTool showAnimaLoading:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUDTool hide];
    });
}

@end
