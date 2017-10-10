//
//  LXNetworkErrorView.m
//  Yml
//
//  Created by LX on 2017/10/10.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXNetworkErrorView.h"

@interface LXNetworkErrorView ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *errorImageView;
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *bottomLabel;
@property (nonatomic, strong) UIButton *reloadBtn;
@property (nonatomic, strong) UIButton *headErrorBtn;
@property (nonatomic, strong) UIImageView *arrowView;

@end

@implementation LXNetworkErrorView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    self.backgroundColor = GLOBAL_BACKGROUND_COLOR;
    
    [self addSubview:self.containerView];
    [self addSubview:self.headErrorBtn];
    [self.containerView addSubview:self.errorImageView];
    [self.containerView addSubview:self.topLabel];
    [self.containerView addSubview:self.bottomLabel];
    [self.containerView addSubview:self.reloadBtn];
    [self.headErrorBtn addSubview:self.arrowView];
    
    _containerView.translatesAutoresizingMaskIntoConstraints = NO;
    _headErrorBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _errorImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _topLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _bottomLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _reloadBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _arrowView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.bottom.equalTo(self);
    }];
    [_errorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_containerView);
        make.centerY.equalTo(_containerView).offset(-100);
    }];
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_containerView);
        make.top.equalTo(_errorImageView.mas_bottom).offset(16);
    }];
    [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_containerView);
        make.top.equalTo(_topLabel.mas_bottom).offset(8);
    }];
    [_reloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_containerView);
        make.top.equalTo(_bottomLabel.mas_bottom).offset(28);
        make.width.equalTo(@103);
        make.height.equalTo(@34);
    }];
    [_headErrorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self);
        make.height.equalTo(@44);
    }];
    [_arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_headErrorBtn).offset(-10);
        make.centerY.equalTo(_headErrorBtn);
    }];
    
}

#pragma mark - Setter/Getter

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor clearColor];
    }
    return _containerView;
}

- (UIImageView *)errorImageView {
    if (!_errorImageView) {
        _errorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"network_error"]];
    }
    return _errorImageView;
}

- (UILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = [UILabel labelWithText:@"网络无法连接" textColor:UIColorFromHex(0x666666) fontSize:18];
    }
    return _topLabel;
}

- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [UILabel labelWithText:@"请检查您的网络" textColor:UIColorFromHex(0xc0c0c0) fontSize:13];
    }
    return _bottomLabel;
}

- (UIButton *)reloadBtn {
    if (!_reloadBtn) {
        _reloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _reloadBtn.backgroundColor = UIColorFromHex(0xf0f0f0);
        [_reloadBtn setTitle:@"重新加载" forState:UIControlStateNormal];
        [_reloadBtn setTitleColor:UIColorFromHex(0x666666)  forState:UIControlStateNormal];
        _reloadBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _reloadBtn.layer.borderColor = UIColorFromHex(0xe2e2e2).CGColor;
        _reloadBtn.layer.borderWidth = 0.5;
        _reloadBtn.layer.cornerRadius = 3;
    }
    return _reloadBtn;
}

- (UIButton *)headErrorBtn {
    if (!_headErrorBtn) {
        _headErrorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headErrorBtn.adjustsImageWhenHighlighted = NO;
        _headErrorBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _headErrorBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _headErrorBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 0);
        _headErrorBtn.backgroundColor = RGBA(0, 0, 0, 0.68);
        _headErrorBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_headErrorBtn setTitle:@"网络连接失败，请检查您的网络设置" forState:UIControlStateNormal];
        [_headErrorBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_headErrorBtn setImage:[UIImage imageNamed:@"error_img"] forState:UIControlStateNormal];
    }
    return _headErrorBtn;
}

- (UIImageView *)arrowView {
    if (!_arrowView) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    }
    return _arrowView;
}
@end
