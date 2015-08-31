//
//  YVCollectionViewAdapter.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVCollectionViewAdapter.h"
#import "YVConstants.h"
#import "YVImageCollectionCell.h"

@interface YVCollectionViewAdapter() <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation YVCollectionViewAdapter

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.loadedObjects count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YVImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YVImageCollectionCellReuseIdentifier forIndexPath:indexPath];
    [cell configureCell:[self.loadedObjects objectAtIndex:indexPath.row]];
    return cell;
}

@end
