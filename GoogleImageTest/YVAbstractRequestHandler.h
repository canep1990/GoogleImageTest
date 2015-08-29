//
//  YVAbstractRequestHandler.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 29.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

@import UIKit;
#import <AFNetworking/AFNetworking.h>

/** Completion block for HTTP request operation */
typedef void(^YVRequestHandlerCompletion)(NSDictionary *loadedData);

/** Abstract request handler */
@protocol YVAbstractRequestHandler <NSObject>

/** Current http operation. Can be cancelled */
@property (strong, nonatomic, readonly) AFHTTPRequestOperation *requestOperation;

/** Send get request to URL with completion */
- (void)getDataFromURLString:(NSString *)URLString forViewController:(UIViewController *)controller completion:(YVRequestHandlerCompletion)completion;

@end
