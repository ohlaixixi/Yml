//
//  LXRefreshHeader.m
//  Yml
//
//  Created by LX on 2017/10/26.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXRefreshHeader.h"

@implementation LXRefreshHeader

- (void)prepare {
    [super prepare];
    
    NSMutableArray *idleImages = [NSMutableArray array];
    for (int i = 0; i < 30; ++i) {
        UIImage *image = [UIImage imageNamed:@"ic_ptr1"];
        [idleImages addObject:image];
    }
    for (NSUInteger i = 1; i<=29; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"ic_ptr%zd", i]];
        [idleImages addObject:image];
    }
    // 设置普通状态的动画图片
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=16; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"ic_refreshing%zd", i]];
        [refreshingImages addObject:image];
    }
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}

@end
