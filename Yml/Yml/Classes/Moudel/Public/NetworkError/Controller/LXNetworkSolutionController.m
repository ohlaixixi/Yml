//
//  LXSolutionController.m
//  Yml
//
//  Created by LX on 2017/10/12.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXNetworkSolutionController.h"

@interface LXNetworkSolutionController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewHeightConstraint;

@end

@implementation LXNetworkSolutionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"解决方案";
    _scrollViewHeightConstraint.constant = SCREEN_WIDTH / 375 * 1237;
}

@end
