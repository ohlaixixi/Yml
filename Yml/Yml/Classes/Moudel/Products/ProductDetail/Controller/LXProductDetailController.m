//
//  LXProductDetailController.m
//  Yml
//
//  Created by LX on 2017/11/17.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXProductDetailController.h"
#import "LXProductDetailView.h"
#import "LXGoodsSelectAttributesView.h"
#import "UIViewController+KNSemiModal.h"

@interface LXProductDetailController ()

@property (nonatomic, strong) LXGoodsSelectAttributesView *selectAttributesView;

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
    
    LXProductDetailView *productDetailView = [[LXProductDetailView alloc] initWithFrame:self.view.bounds];
    __weak typeof(self) weakself = self;
    productDetailView.productDetailBackBlock = ^{
        [weakself.navigationController popViewControllerAnimated:YES];
    };
    
    productDetailView.productClickBlock = ^{
        [weakself test];
    };
    
    self.selectAttributesView.dissmissViewBlock = ^{
//        [weakself dismissSemiModalView];
    };
    
    [self.view addSubview:productDetailView];
}

- (void)test {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.5)];
    view.backgroundColor = [UIColor redColor];
    [self presentSemiView:view withOptions:@{
                                             KNSemiModalOptionKeys.parentAlpha : @0.8,
                                             KNSemiModalOptionKeys.parentScale : @0.9,
                                             }];
}

#pragma mark - Setter/Getter
- (LXGoodsSelectAttributesView *)selectAttributesView {
    if (!_selectAttributesView) {
        _selectAttributesView = [[LXGoodsSelectAttributesView alloc] initWithFrame:self.view.bounds];
    }
    return _selectAttributesView;
}

@end
