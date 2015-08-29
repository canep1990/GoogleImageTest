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
    __weak YVGoogleImageLoadingService *weakSelf = self;
    [self.requestHandler getDataFromURLString:URLString forViewController:controller completion:^(NSDictionary *loadedData, NSError *requestError) {
        if (!requestError)
        {
            
        }
        else
        {
            [weakSelf.parser parseResponse:loadedData completion:^(NSArray *parsedObjects, NSError *parseError) {
                if (completion) completion(parsedObjects, parseError);
            }];
        }
    }];
}

@end
