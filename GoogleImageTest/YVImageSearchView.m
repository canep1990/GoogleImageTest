//
//  YVImageSearchView.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVImageSearchView.h"

@interface YVImageSearchView()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation YVImageSearchView

- (IBAction)loadDataForText:(id)sender
{
    id <YVImageSearchViewDelegate> delegate = (id <YVImageSearchViewDelegate>)self.delegate;
    if (delegate)
    {
        [delegate searchGoogleImagesForString:self.textField.text];
    }
}

@end
