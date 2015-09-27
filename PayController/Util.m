//
//  Util.m
//  REFrostedViewControllerStoryboards
//
//  Created by Shang Wang on 9/18/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "Util.h"

@implementation Util

static UIImage* _imageOfButtonGreen = nil;

+ (void)initialize
{
}

+ (void)drawButtonGreen
{
    UIColor *green = [UIColor colorWithRed: 0.404 green: 0.835 blue: 0.663 alpha: 1];
    UIBezierPath* rectanglePath = UIBezierPath.bezierPath;
    [rectanglePath moveToPoint: CGPointMake(0, 106)];
    [rectanglePath addCurveToPoint: CGPointMake(10, 116) controlPoint1: CGPointMake(-0, 111.52) controlPoint2: CGPointMake(4.48, 116)];
    [rectanglePath addLineToPoint: CGPointMake(670, 116)];
    [rectanglePath addCurveToPoint: CGPointMake(680, 106) controlPoint1: CGPointMake(675.52, 116) controlPoint2: CGPointMake(680, 111.52)];
    [rectanglePath addLineToPoint: CGPointMake(680, 10)];
    [rectanglePath addCurveToPoint: CGPointMake(670, 0) controlPoint1: CGPointMake(680, 4.48) controlPoint2: CGPointMake(675.52, 0)];
    [rectanglePath addLineToPoint: CGPointMake(10, 0)];
    [rectanglePath addCurveToPoint: CGPointMake(0, 10) controlPoint1: CGPointMake(4.48, -0) controlPoint2: CGPointMake(0, 4.48)];
    [rectanglePath addLineToPoint: CGPointMake(0, 106)];
    [rectanglePath closePath];
    [green setFill];
    [rectanglePath fill];
}

+ (UIImage*)imageOfButtonGreen
{
    if (_imageOfButtonGreen)
        return _imageOfButtonGreen;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(680, 116), NO, 0.0f);
    [Util drawButtonGreen];
    
    _imageOfButtonGreen = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return _imageOfButtonGreen;
}

+ (UIImage*)scaleImage:(UIImage *)image toSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
