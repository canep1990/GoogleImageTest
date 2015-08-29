//
//  YVAbstractService.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 29.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVAbstractRequestHandler.h"
#import "YVAbstractParser.h"

typedef void(^YVServiceCompletion)(NSArray *loadedObjects, NSError *error);

/** Abstract http service */
@protocol YVAbstractHTTPService <NSObject>

/** Current parser property */
@property (strong, readonly, nonatomic) id <YVAbstractParser> parser;

/** Current request handler */
@property (strong, readonly, nonatomic) id <YVAbstractRequestHandler> requestHandler;

/** Load the data from url */
- (void)loadDataFromURLString:(NSString *)URLString forViewController:(UIViewController *)controller completion:(YVServiceCompletion)completion;

@end
