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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试";
    self.showReloadBtn = YES;
    
    NSDictionary *params = @{@"uid":@"",
                             @"token":@""};
    [PublicTools setData:params toUserDefaultsKey:kUserInfo];
    
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

- (void)push {
    [self.navigationController pushViewController:[[LXCommunityController alloc] init] animated:YES];
}

@end
