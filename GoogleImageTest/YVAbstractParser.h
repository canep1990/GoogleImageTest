//
//  YVAbstractParser.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 29.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^YVParserCompletion)(NSArray *parsedObjects, NSError *error);

/** Abstract parser */
@protocol YVAbstractParser <NSObject>

/** Parse respinse with completion */
- (void)parseResponse:(NSDictionary *)response completion:(YVParserCompletion)completion;

@end
