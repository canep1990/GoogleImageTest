//
//  YVGoogleImageModel.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 29.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Model object representing Google Image */
@interface YVGoogleImageModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *imageURLString;

@end
