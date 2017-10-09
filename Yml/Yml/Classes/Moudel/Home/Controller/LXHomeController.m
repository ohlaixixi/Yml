//
//  LXHomeController.m
//  Yml
//
//  Created by 希 on 2017/6/12.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXHomeController.h"

#define kUserInfo @"kUserInfo"

@interface LXHomeController ()

@end

@implementation LXHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GLOBAL_BACKGROUND_COLOR;
    self.title = @"测试";
    
    NSDictionary *params = @{@"uid":@"",
                             @"token":@""};
    [PublicTools setData:params toUserDefaultsKey:kUserInfo];
    [[NetworkTool sharedNetworkTool] POST:@"?method=msg.readNum" parameters:nil success:^(id data) {
        MLog(@"%@",data);
    } failure:^(NSError *error) {
        MLog(@"==>%@",error);
    }];
}

@end
