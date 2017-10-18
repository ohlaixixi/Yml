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

#define kUserInfo @"kUserInfo"

@interface LXHomeController ()

@end

@implementation LXHomeController

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"测试";
    NSDictionary *params = @{@"uid":@"",
                             @"token":@""};
    [PublicTools setData:params toUserDefaultsKey:kUserInfo];
    
    self.showReloadBtn = YES;
    
    [[NetworkTool sharedNetworkTool] POST:@"?method=msg.readNum" parameters:nil success:^(id data) {
        MLog(@"%@",data);
    } failure:^(NSError *error) {
        MLog(@"==>%@",error);
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    
//    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
//    testView.backgroundColor = [UIColor redColor];
//    UIView *test2 = [[UIView alloc]  initWithFrame:CGRectMake(0, 0, 300, 300)];
//    test2.backgroundColor = [UIColor blueColor];
//    [testView addSubview:test2];
//    [self.view addSubview:testView];
}

- (void)loadData {
    MLog(@"loadData");
    if ([NetworkTool checkNetwork]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.hiddenNetworkErrorView = YES;
        });
    }
}

- (void)push {
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:cancelAction];
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];

//    [self.navigationController pushViewController:[[LXCommunityController alloc] init] animated:YES];
    
    
    LXAlertView *alertView = [LXAlertView showAlertViewWithTitle:nil message:@"文本文本文文本文本文本文本文本文本文本文本文本文本本" buttonTitles:@[@"取消",@"确定"] handler:^(LXAlertView *alertView, NSInteger buttonIndex) {
        MLog(@"%ld",buttonIndex);
    }];
    [alertView show];
}

@end
