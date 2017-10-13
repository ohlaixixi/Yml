//
//  BaseListViewController.m
//  Yml
//
//  Created by LX on 2017/10/13.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "BaseListViewController.h"
#import "LXEmptyView.h"

@interface BaseListViewController ()

@property (nonatomic, weak) LXEmptyView *emptyView;

@end

@implementation BaseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LXEmptyView *emptyView = [[LXEmptyView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_emptyView];
    _emptyView = emptyView;
}

- (void)showEmptyViewWithImageSource:(NSString *)imageStr title:(NSString *)title subTitle:(NSString *)subTitle {
    [self.view bringSubviewToFront:_emptyView];
    [_emptyView showWithImageSource:imageStr title:title subTitle:subTitle];
}

@end
