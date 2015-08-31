//
//  YVRequestHandler.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 29.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVRequestHandler.h"
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface YVRequestHandler()

@property (strong, nonatomic, readwrite) AFHTTPRequestOperation *requestOperation;

@end

@implementation YVRequestHandler

- (void)getDataFromURLString:(NSString *)URLString forViewController:(UIViewController *)controller completion:(YVRequestHandlerCompletion)completion
{
    NSAssert(URLString != nil, @"URL can't be nil!");
    NSString *encodedString = [URLString stringByRemovingPercentEncoding];
    NSLog(@"encoded url: %@", encodedString);
    if (controller) [MBProgressHUD showHUDAddedTo:controller.view animated:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    self.requestOperation = [manager GET:encodedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        if (controller) [MBProgressHUD hideAllHUDsForView:controller.view animated:YES];
        if (completion) completion(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        if (controller)
        {
            [MBProgressHUD hideAllHUDsForView:controller.view animated:YES];
            if (completion) completion(nil, error);
        }
    }];
}

@end
