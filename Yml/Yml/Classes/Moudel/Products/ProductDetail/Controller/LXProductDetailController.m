//
//  LXProductDetailController.m
//  Yml
//
//  Created by LX on 2017/11/17.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXProductDetailController.h"
#import "LXProductDetailView.h"
#import "UIViewController+KNSemiModal.h"

@interface LXProductDetailController ()

@end

@implementation LXProductDetailController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    LXProductDetailView *productDetailView = [[LXProductDetailView alloc] initWithFrame:self.view.bounds];
    __weak typeof(self) weakself = self;
    productDetailView.productDetailBackBlock = ^{
        [weakself.navigationController popViewControllerAnimated:YES];
    };
    
    productDetailView.productClickBlock = ^{
        [weakself test];
    };
    
    [self.view addSubview:productDetailView];
}

- (void)test {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 300)];
    view.backgroundColor = [UIColor lightGrayColor];
    [self presentSemiView:view withOptions:@{
                                             KNSemiModalOptionKeys.parentAlpha : @(0.8),
                                             KNSemiModalOptionKeys.parentScale : @(0.9),
                                             }];
}

@end
