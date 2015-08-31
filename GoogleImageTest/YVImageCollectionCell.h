//
//  YVImageCollectionCell.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVGoogleImageModel.h"

/** Custom collection cell with images */
@interface YVImageCollectionCell : UICollectionViewCell

/** Method for configuring cell */
- (void)configureCell:(YVGoogleImageModel *)model;

@end
