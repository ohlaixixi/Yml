//
//  LXGoodsSelectAttributesView.m
//  Yml
//
//  Created by LX on 2017/11/20.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXGoodsSelectAttributesView.h"

@interface LXGoodsSelectAttributesView ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation LXGoodsSelectAttributesView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
//    [self addSubview:self.bgView];

    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.5, SCREEN_WIDTH, SCREEN_HEIGHT*0.5)];
    contentView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:contentView];
    
    UIImageView *goodsImageView = [[UIImageView alloc] init];
    goodsImageView.backgroundColor = [UIColor redColor];
    
    UILabel *priceLabel = [UILabel labelWithText:@"$100" textColor:[UIColor blackColor] fontSize:16];
    
    [contentView addSubview:goodsImageView];
    [contentView addSubview:priceLabel];
    
    [goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(-30);
        make.left.equalTo(contentView).offset(10);
        make.width.height.equalTo(@150);
    }];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(30);
        make.left.equalTo(goodsImageView.mas_right).offset(10);
    }];
}

- (void)dismiss:(UITapGestureRecognizer *)tapGesture {
    [UIView animateWithDuration:0.2 animations:^{
        self.bgView.alpha = 0;
    }completion:^(BOOL finished) {
        self.dissmissViewBlock();
        self.bgView.alpha = 0.3;
    }];
}

- (UIView *)bgView {
    if (!_bgView) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        bgView.alpha = 0.3;
        bgView.backgroundColor = [UIColor blackColor];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
        [bgView addGestureRecognizer:tapGesture];
        _bgView = bgView;
    }
    return _bgView;
}
@end
