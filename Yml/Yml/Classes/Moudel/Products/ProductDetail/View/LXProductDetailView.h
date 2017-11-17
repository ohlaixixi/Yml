//
//  LXProductDetailView.h
//  Yml
//
//  Created by LX on 2017/11/17.
//  Copyright © 2017年 xi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXProductDetailView : UIView

@property (nonatomic, copy) void (^productDetailBackBlock)();

@property (nonatomic, copy) void (^productClickBlock)();

@end
