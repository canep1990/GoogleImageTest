//
//  YVImageDisplayViewController.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+viewDelegateAdditions.h"

/** Delegate for configuring the view from newly loaded items */
@protocol YVImageDisplayViewControllerDelegate <YVViewControllerDelegate>

- (void)configureView:(NSArray *)loadedModels;

@end

/** Controller for displaying images */
@interface YVImageDisplayViewController : UIViewController

/** Newly loaded images array */
@property (copy, nonatomic) NSArray *loadedModels;

@end
