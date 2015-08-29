//
//  YVGoogleImageModel.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 29.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVGoogleImageModel.h"
#import "NSDictionary+ContainsKey.h"

static NSString * const kURLJSONKey = @"tbUrl";
static NSString * const kTitleJSONKey = @"title";

@implementation YVGoogleImageModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        if ([dictionary containsKey:kURLJSONKey])
            self.imageURLString = [dictionary objectForKey:kURLJSONKey];
        if ([dictionary containsKey:kTitleJSONKey])
            self.title = [dictionary objectForKey:kTitleJSONKey];
    }
    return self;
}

@end
