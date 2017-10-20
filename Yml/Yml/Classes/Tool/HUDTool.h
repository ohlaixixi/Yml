//
//  HUDTool.h
//  Yml
//
//  Created by LX on 2017/10/19.
//  Copyright © 2017年 xi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HUDTool : NSObject
/**
 菊花
 */
+ (void)showLoading:(UIView *)view;
/**
 动画加载
 */
+ (void)showAnimaLoading:(UIView *)view;
/**
 文字
 */
+ (void)showMessage:(NSString *)message toView:(UIView *)view;
/**
 文字+图片
 */
+ (void)showMessage:(NSString *)message image:(NSString *)imageName toView:(UIView *)view;
/**
 隐藏hud
 */
+ (void)hide;

@end
