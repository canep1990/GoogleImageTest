//
//  YVImageCollectionCell.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVImageCollectionCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface YVImageCollectionCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YVImageCollectionCell

- (void)configureCell:(YVGoogleImageModel *)model
{
    __weak YVImageCollectionCell *weakCell = self;
    [self.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model.imageURLString]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         weakCell.imageView.image = image;
         [weakCell setNeedsLayout];
     } failure:nil];
}

@end
