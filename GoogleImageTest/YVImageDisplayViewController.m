//
//  YVImageDisplayViewController.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVImageDisplayViewController.h"
#import "YVImageDisplayView.h"

@interface YVImageDisplayViewController ()

@end

@implementation YVImageDisplayViewController

- (void)loadView
{
    YVImageDisplayView *view = [[YVImageDisplayView alloc] init];
    self.view = view;
}

@end
