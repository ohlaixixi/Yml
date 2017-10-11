//
//  BaseViewController.m
//  Yml
//
//  Created by LX on 2017/10/9.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "BaseViewController.h"
#import "LXNetworkErrorView.h"
#import "LXNetworkErrorHeadView.h"

@interface BaseViewController ()

@property (nonatomic, strong) LXNetworkErrorView *networkErrorView;
@property (nonatomic, strong) LXNetworkErrorHeadView *networkErrorHeadView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GLOBAL_BACKGROUND_COLOR;
    [self.view addSubview:self.networkErrorView];
    [self.view addSubview:self.networkErrorHeadView];
    
    if (![NetworkTool checkNetwork]) {
        _networkErrorHeadView.networkState = NO;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNetworkStateChange:)
                                                 name:kNotificationNetworkError object:nil];
}

/**
 监测网络状态
 */
- (void)handleNetworkStateChange:(NSNotification *)notification {
    [self.view bringSubviewToFront:_networkErrorView];
    [self.view bringSubviewToFront:_networkErrorHeadView];
    BOOL networkState = [notification.userInfo[@"networkStatus"] boolValue];
    _networkErrorHeadView.networkState = networkState;
}

- (UIView *)networkErrorView {
    if (!_networkErrorView) {
        _networkErrorView = [[LXNetworkErrorView alloc] initWithFrame:self.view.bounds];
    }
    return _networkErrorView;
}

- (LXNetworkErrorHeadView *)networkErrorHeadView {
    if (!_networkErrorHeadView) {
        _networkErrorHeadView = [[LXNetworkErrorHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    }
    return _networkErrorHeadView;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
