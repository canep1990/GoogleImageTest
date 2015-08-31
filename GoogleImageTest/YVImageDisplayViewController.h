//
//  YVImageDisplayViewController.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+viewDelegateAdditions.h"

@protocol YVImageDisplayViewControllerDelegate <YVViewControllerDelegate>

- (void)configureView:(NSArray *)loadedModels;

@end

@interface YVImageDisplayViewController : UIViewController

@property (copy, nonatomic) NSArray *loadedModels;

@end
