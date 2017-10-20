//
//  HUDTool.m
//  Yml
//
//  Created by LX on 2017/10/19.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "HUDTool.h"
#import "MBProgressHUD.h"
#import <ImageIO/ImageIO.h>

#define HUDManager [HUDTool shareInstance].hud
#define kDefaultTimeInterval 0.75

typedef NS_ENUM(NSInteger,HUDMode){
    HUDModeOnlyText,              //文字
    HUDModeLoading,               //加载菊花
    HUDModeCustomAnimation,       //自定义加载动画（序列帧实现）
    HUDModeCustomerImage          //自定义图片
};

@interface HUDTool ()

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation HUDTool

+ (instancetype)shareInstance {
    static HUDTool *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HUDTool alloc] init];
    });
    return instance;
}

+ (void)showLoading:(UIView *)view {
    [self show:@"" inView:view mode:HUDModeLoading customView:nil];
}

+ (void)showMessage:(NSString *)message toView:(UIView *)view {
    [self show:message inView:view mode:HUDModeOnlyText customView:nil];
}

+ (void)showMessage:(NSString *)message image:(NSString *)imageName toView:(UIView *)view {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [self show:message inView:view mode:HUDModeCustomerImage customView:imageView];
}

+ (void)showAnimaLoading:(UIView *)view {
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"loading" withExtension:@"gif"];
    CGImageSourceRef gifSource = CGImageSourceCreateWithURL((CFURLRef)fileUrl, NULL);//将GIF图片转换成对应的图片源
    size_t frameCout=CGImageSourceGetCount(gifSource);//获取其中图片源个数，即由多少帧图片组成
    NSMutableArray* frames=[[NSMutableArray alloc] init];//定义数组存储拆分出来的图片
    
    for (size_t i=0; i<frameCout; i++) {
        CGImageRef imageRef=CGImageSourceCreateImageAtIndex(gifSource, i, NULL);//从GIF图片中取出源图片
        UIImage* imageName=[UIImage imageWithCGImage:imageRef];//将图片源转换成UIimageView能使用的图片源
        [frames addObject:imageName];//将图片加入数组中
        CGImageRelease(imageRef);
        
    }
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.animationImages=frames;//将图片数组加入UIImageView动画数组中
    imgView.animationDuration=1;//每次动画时长
    [imgView startAnimating];//开启动画，此处没有调用播放次数接口，UIImageView默认播放次数为无限次，故这里不做处理
    
    [self show:@"111" inView:view mode:HUDModeCustomAnimation customView:imgView];
}

+ (void)hide {
    if (HUDManager != nil) {
        [HUDManager hideAnimated:YES];
    }
}

+ (void)show:(NSString *)message inView:(UIView *)view mode:(HUDMode)mode customView:(UIImageView *)customView {
    if (HUDManager != nil) {
        [HUDManager hideAnimated:YES];
        HUDManager = nil;
    }
    
    HUDManager = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUDManager.bezelView.color = [UIColor blackColor];
//    HUDManager.contentColor = [UIColor whiteColor];
    [HUDManager setRemoveFromSuperViewOnHide:YES];
    HUDManager.detailsLabel.font = [UIFont systemFontOfSize:14];
    
    switch (mode) {
        case HUDModeOnlyText:
            HUDManager.label.text = message;
            HUDManager.mode = MBProgressHUDModeText;
            [HUDManager hideAnimated:YES afterDelay:kDefaultTimeInterval];
            break;
            
        case HUDModeLoading:
            HUDManager.mode = MBProgressHUDModeIndeterminate;
            break;
            
        case HUDModeCustomerImage:
            HUDManager.mode = MBProgressHUDModeCustomView;
            HUDManager.customView = customView;
            [HUDManager hideAnimated:YES afterDelay:1.0];
            break;
            
        case HUDModeCustomAnimation:
            //这里设置动画的背景色
            HUDManager.mode = MBProgressHUDModeCustomView;
            HUDManager.customView = customView;
            break;
            
        default:
            break;
    }
}

@end
