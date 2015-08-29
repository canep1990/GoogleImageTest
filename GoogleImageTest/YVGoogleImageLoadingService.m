//
//  YVGoogleImageLoadingService.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 29.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVGoogleImageLoadingService.h"
#import "YVRequestHandler.h"
#import "YVGoogleImageParser.h"

@interface YVGoogleImageLoadingService()

@property (strong, readwrite, nonatomic) id <YVAbstractParser> parser;

@property (strong, readwrite, nonatomic) id <YVAbstractRequestHandler> requestHandler;

@end

@implementation YVGoogleImageLoadingService

- (instancetype)init
{
    if (self = [super init])
    {
        self.requestHandler = [YVRequestHandler new];
        self.parser = [YVGoogleImageParser new];
    }
    return self;
}

- (void)loadDataFromURLString:(NSString *)URLString forViewController:(UIViewController *)controller completion:(YVServiceCompletion)completion
{
    
}

@end
