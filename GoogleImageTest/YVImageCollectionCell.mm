//
//  YVImageCollectionCell.m
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import "YVImageCollectionCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <OpenCV/opencv2/opencv.hpp>
#import "UIImage+OpenCV.h"

@interface YVImageCollectionCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YVImageCollectionCell

- (void)configureCell:(YVGoogleImageModel *)model
{
    __weak YVImageCollectionCell *weakCell = self;
    [self.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model.imageURLString]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
     {
         IplImage *imageRef = [UIImage IplImageFromUIImage:image];
         IplImage *imageGray = cvCreateImage(cvGetSize(imageRef),IPL_DEPTH_8U,1);
         cvCvtColor(imageRef, imageGray, CV_RGB2GRAY);
         UIImage *blackAndWhiteImage = [UIImage UIImageFromIplImage:imageGray];
         
         weakCell.imageView.image = blackAndWhiteImage;
         [weakCell setNeedsLayout];
     } failure:nil];
}

@end
