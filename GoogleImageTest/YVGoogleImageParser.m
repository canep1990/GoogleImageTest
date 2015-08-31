//
//  YVGoogleImageParser.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 29.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVGoogleImageParser.h"
#import "NSDictionary+ContainsKey.h"
#import "YVGoogleImageModel.h"
#import "YVConstants.h"

static NSString * const kResponseDataJSONKey = @"responseData";
static NSString * const kResultsDataJSONKey = @"results";
static NSString * const kJSONErrorString = @"No images found!";

@implementation YVGoogleImageParser

- (void)parseResponse:(NSDictionary *)response completion:(YVParserCompletion)completion
{
    if ([response containsKey:kResponseDataJSONKey])
    {
        NSDictionary *responseData = [response objectForKey:kResponseDataJSONKey];
        NSLog(@"responseData: %@", responseData);
        if ([responseData containsKey:kResultsDataJSONKey])
        {
            NSArray *jsonResults = [responseData objectForKey:kResultsDataJSONKey];
            if (jsonResults && jsonResults.count > 0)
            {
                NSMutableArray *array = [NSMutableArray new];
                for (NSDictionary *jsonImages in jsonResults)
                {
                    YVGoogleImageModel *model = [[YVGoogleImageModel alloc] initWithDictionary:jsonImages];
                    [array addObject:model];
                }
                if (completion) completion(array, nil);
            }
            else
            {
                NSLog(@"jsonResults");
                NSError *error = [NSError errorWithDomain:YVParserErrorDomain code:YVNoItemsFoundJSONError userInfo:@{NSLocalizedDescriptionKey: kJSONErrorString}];
                if (completion) completion(nil, error);
            }
        }
        else
        {
            NSLog(@"containsKey:kResultsDataJSONKey");
            NSError *error = [NSError errorWithDomain:YVParserErrorDomain code:YVNoItemsFoundJSONError userInfo:@{NSLocalizedDescriptionKey: kJSONErrorString}];
            if (completion) completion(nil, error);
        }
    }
    else
    {
        NSLog(@"containsKey:kResponseDataJSONKey");
        NSError *error = [NSError errorWithDomain:YVParserErrorDomain code:YVNoItemsFoundJSONError userInfo:@{NSLocalizedDescriptionKey: kJSONErrorString}];
        if (completion) completion(nil, error);
    }
}

@end
