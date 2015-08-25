//
//  UIImage+Utils.m
//  微博个人详情页
//
//  Created by Rick on 15/8/25.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

+(UIImage *) imageWithColor:(UIColor *)colour{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [colour CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
