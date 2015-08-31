//
//  YVImageDisplayView.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseView.h"

@protocol YVImageDisplayViewDelegate <YVBaseViewDelegate>

- (void)configureView:(NSArray *)objects;

@end

@interface YVImageDisplayView : YVBaseView

@end
