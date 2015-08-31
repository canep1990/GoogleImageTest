//
//  UIImage+OpenCV.h
//  GoogleImageTest
//
//  Created by Юрий Воскресенский on 31.08.15.
//  Copyright (c) 2015 Юрий Воскресенский. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OpenCV/opencv2/opencv.hpp>

@interface UIImage (OpenCV)

+ (IplImage*)IplImageFromUIImage:(UIImage*)image;
+ (UIImage*)UIImageFromIplImage:(IplImage*)image;

@end
