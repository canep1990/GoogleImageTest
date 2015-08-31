//
//  YVImageDisplayView.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVImageDisplayView.h"
#import "YVConstants.h"
#import "YVImageCollectionCell.h"

@interface YVImageDisplayView()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation YVImageDisplayView

- (void)awakeFromNib
{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YVImageCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:YVImageCollectionCellReuseIdentifier];
}

@end
