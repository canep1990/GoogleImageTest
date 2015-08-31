//
//  YVAlertView.h
//  UserLoadTest
//
//  Created by Юрий Воскресенский on 10.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

@import UIKit;

/** Protocol for handling alert actions */
@protocol YVAlertViewDelegate <NSObject>

/** Handle button actions */
- (void)didTapButtonAtIndex:(NSUInteger)index;

@end

/** Custom alert view handler to support old ios 7 UIAlertView API and ios 8 UIAlertController API */
@interface YVAlertView : NSObject

/** Delegate property */
@property (weak, nonatomic) id <YVAlertViewDelegate> delegate;

/** Initializer for creating the alert */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id <YVAlertViewDelegate> )delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)titles controller:(UIViewController *)controller;

/** Display the alert */
- (void)show;

@end
