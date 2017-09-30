//
//  LXNetworkTool.h
//  
//
//  Created by 希 on 16/6/28.
//  Copyright © 2016年 xi. All rights reserved.
//  网络工具

#import <Foundation/Foundation.h>
#import "LXSingleton.h"

typedef enum {
    Get,
    Post
} RequestMethod;

@interface NetworkTool : NSObject
LXSingleton_h(NetworkTool);

- (void)get:(NSString *)URLString withParameters:(id)parameters success:(void (^)(NSURLSessionDataTask * task, id responseObject))success failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

- (void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id data))success failure:(void (^)(NSError * error))failure;
@end
