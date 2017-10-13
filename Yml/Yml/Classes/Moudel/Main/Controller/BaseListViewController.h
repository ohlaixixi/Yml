//
//  BaseListViewController.h
//  Yml
//
//  Created by LX on 2017/10/13.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseListViewController : BaseViewController

/**
 显示空状态视图
 */
- (void)showEmptyViewWithImageSource:(NSString *)imageStr title:(NSString *)title subTitle:(NSString *)subTitle;

@end
