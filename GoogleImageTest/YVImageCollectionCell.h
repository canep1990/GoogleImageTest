//
//  YVImageCollectionCell.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVGoogleImageModel.h"

@interface YVImageCollectionCell : UICollectionViewCell

- (void)configureCell:(YVGoogleImageModel *)model;

@end
