//
//  YVImageSearchViewController.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVImageSearchViewController.h"
#import "YVImageSearchView.h"
#import "YVAlertView.h"
#import "YVConstants.h"
#import "YVGoogleImageLoadingService.h"
#import "YVAbstractHTTPService.h"

@interface YVImageSearchViewController() <YVImageSearchViewDelegate>

@property (strong, nonatomic) YVAlertView *alertView;
@property (strong, nonatomic) id <YVAbstractHTTPService> httpService;

@end

@implementation YVImageSearchViewController

- (void)dealloc
{
    [self.httpService.requestHandler.requestOperation cancel];
}

- (void)loadView
{
    YVImageSearchView *view = [[YVImageSearchView alloc] init];
    view.delegate = self;
    self.view = view;
}

- (void)viewDidLoad
{
    self.httpService = [[YVGoogleImageLoadingService alloc] init];
    self.navigationController.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

#pragma mark - YVImageSearchViewDelegate

- (void)searchGoogleImagesForString:(NSString *)string
{
    if (string.length > 0)
    {
        __weak YVImageSearchViewController *weakSelf = self;
        [self.httpService loadDataFromURLString:[NSString stringWithFormat:@"%@%@", YVGoogleImageAPIBaseURLString, string] forViewController:self completion:^(NSArray *loadedObjects, NSError *error) {
            if (!error)
            {
                NSLog(@"loadedObjects: %@", loadedObjects);
            }
            else
            {
                weakSelf.alertView = [[YVAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil controller:self];
                [weakSelf.alertView show];
            }
        }];
    }
    else
    {
        self.alertView = [[YVAlertView alloc] initWithTitle:@"Error" message:@"Text field is empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil controller:self];
        [self.alertView show];
    }
}

@end
