//
//  YVAlertView.m
//  UserLoadTest
//
//  Created by Юрий Воскресенский on 10.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVAlertView.h"

@interface YVAlertView () <UIAlertViewDelegate>

@property (strong, nonatomic) UIAlertView *alertView;
@property (weak, nonatomic) UIAlertController *alertController;
@property (weak, nonatomic) UIViewController *controller;

@end

@implementation YVAlertView

- (void)dealloc
{
    NSLog(@"YV Alert dealloc");
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)titles controller:(UIViewController *)controller
{
    NSAssert(cancelButtonTitle != nil, @"CancelButtonTitle can't be nil!");
    NSAssert(controller != nil, @"Controller can't be nil!");
    if (self = [super init])
    {
        self.controller = controller;
        self.delegate = delegate;
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
        {
            self.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            self.alertController.accessibilityLabel = @"AlertView";
            UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                if (self.delegate)
                {
                    [self.delegate didTapButtonAtIndex:0];
                }
            }];
            [self.alertController addAction:action];
            if (titles && titles.count > 0)
            {
                [titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
                {
                    NSAssert([obj isKindOfClass:[NSString class]], @"Titles array must contain only NSString objects!");
                    NSString *title = obj;
                    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                    {
                        if (self.delegate)
                        {
                            [self.delegate didTapButtonAtIndex:idx+1];
                        }
                    }];
                    [self.alertController addAction:action];
                }];
            }
        }
        else
        {
            self.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
            self.alertView.accessibilityLabel = @"AlertView";
            if (titles && titles.count > 0)
            {
                [titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
                {
                    NSAssert([obj isKindOfClass:[NSString class]], @"Titles array must contain only NSString objects!");
                    NSString *title = obj;
                    [self.alertView addButtonWithTitle:title];
                }];
            }
        }
    }
    return self;
}

- (void)show
{
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
    {
        [self.controller presentViewController:self.alertController animated:YES completion:nil];
    }
    else
    {
        [self.alertView show];
    }
}

#pragma mark - Alert View delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.delegate)
    {
        [self.delegate didTapButtonAtIndex:buttonIndex];
    }
}

@end
