//
//  LXHomeController.m
//  Yml
//
//  Created by 希 on 2017/6/12.
//  Copyright © 2017年 xi. All rights reserved.
//

#import "LXHomeController.h"

@interface LXHomeController ()

@end

@implementation LXHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GLOBAL_BACKGROUND_COLOR;
    
    NSDictionary *params = @{@"uid":@"",
                             @"token":@"11"};
    
//    [[NetworkTool sharedNetworkTool] post:@"?method=msg.readNum"
//                           parameters:nil
//                            success:^(NSURLSessionDataTask *task, id responseObject) {
//                                
//                                MLog(@"%@",responseObject);
//
//                            } failure:^(NSURLSessionDataTask *task, NSError *error) {
//                                MLog(@"==>%@",error);
//    }];
    [[NetworkTool sharedNetworkTool] post:@"?method=msg.readNum" parameters:params success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}


-(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}
@end
