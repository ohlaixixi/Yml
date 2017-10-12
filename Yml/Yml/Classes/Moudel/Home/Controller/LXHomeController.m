//
//  LXHomeController.m
//  Yml
//
//  Created by 希 on 2017/6/12.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXHomeController.h"
#import "LXCommunityController.h"

#define kUserInfo @"kUserInfo"

@interface LXHomeController ()

@end

@implementation LXHomeController

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    UIView *testView = [[UIView alloc] initWithFrame:self.view.bounds];
    testView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:testView];
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
    [self.navigationController pushViewController:[[LXCommunityController alloc] init] animated:YES];
}

@end
