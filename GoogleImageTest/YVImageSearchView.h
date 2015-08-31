//
//  YVImageSearchView.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVBaseView.h"

/** Delegate protocol for loading data from search string */
@protocol YVImageSearchViewDelegate <YVBaseViewDelegate>

/** Search for google image with query string */
- (void)searchGoogleImagesForString:(NSString *)string;

@end

/** View for searching the images */
@interface YVImageSearchView : YVBaseView

@end
