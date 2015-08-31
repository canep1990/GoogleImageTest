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
#import "YVCollectionViewAdapter.h"

CGFloat const kItemSize = 70;
CGFloat const kStandardInsetValue = 10;

@interface YVImageDisplayView()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet YVCollectionViewAdapter *collectionViewAdapter;

@end

@implementation YVImageDisplayView

- (void)awakeFromNib
{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YVImageCollectionCell class]) bundle:nil] forCellWithReuseIdentifier:YVImageCollectionCellReuseIdentifier];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(kItemSize, kItemSize);
    layout.sectionInset = UIEdgeInsetsMake(kStandardInsetValue, kStandardInsetValue, kStandardInsetValue, kStandardInsetValue);
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView setCollectionViewLayout:layout];
}

- (void)configureView:(NSArray *)loadedModels
{
    self.collectionViewAdapter.loadedObjects = loadedModels;
    [self.collectionView reloadData];
}

@end
