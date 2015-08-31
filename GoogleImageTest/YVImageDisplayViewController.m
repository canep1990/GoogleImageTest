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
    self.viewDelegate = view;
    self.view = view;
}

- (void)viewDidLoad
{
    if (self.viewDelegate)
    {
        id <YVImageDisplayViewControllerDelegate> delegate = (id <YVImageDisplayViewControllerDelegate>)self.viewDelegate;
        [delegate configureView:self.loadedModels];
    }
}

@end
