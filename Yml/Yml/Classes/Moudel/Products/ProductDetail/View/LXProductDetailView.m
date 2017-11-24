//
//  LXProductDetailView.m
//  Yml
//
//  Created by LX on 2017/11/17.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXProductDetailView.h"

@interface LXProductDetailView ()

@property (nonatomic, strong) UIView *navBarView;

@end

@implementation LXProductDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    UIButton *backButton = [UIButton buttonWithTitle:@"返回" withFontSize:15 withTitleColor:[UIColor blueColor] withTarget:self withAction:@selector(backButtonClick)];
    UIButton *goodsButton = [UIButton buttonWithTitle:@"商品" withFontSize:15 withTitleColor:[UIColor blueColor] withTarget:self withAction:@selector(productBtnClick)];
    UIButton *detailButton = [UIButton buttonWithTitle:@"详情" withFontSize:15 withTitleColor:[UIColor blueColor] withTarget:self withAction:@selector(productBtnClick)];

    [self addSubview:self.navBarView];
    [self.navBarView addSubview:backButton];
    [self.navBarView addSubview:goodsButton];
    [self.navBarView addSubview:detailButton];

    [self.navBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@64);
    }];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.navBarView);
        make.width.equalTo(@44);
    }];
    [goodsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.navBarView);
        make.width.equalTo(@44);
        make.centerX.equalTo(self.navBarView).offset(-44);
    }];
    [detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.navBarView);
        make.width.equalTo(@44);
        make.centerX.equalTo(self.navBarView).offset(44);
    }];
}

- (void)backButtonClick {
    self.productDetailBackBlock();
    NSLog(@"backButtonClick");
}

- (void)productBtnClick {
    self.productClickBlock();
}

#pragma mark - Setter/Getter

- (UIView *)navBarView {
    if (!_navBarView) {
        _navBarView = [[UIView alloc] init];
        _navBarView.backgroundColor = [UIColor whiteColor];
    }
    return _navBarView;
}

@end
