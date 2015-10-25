//
//  ServiceRSVpTitle.m
//  GoParking
//
//  Created by Shang Wang on 10/16/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "ServiceRSVpTitle.h"

@implementation ServiceRSVpTitle
@synthesize profileImg;
- (void)awakeFromNib {
    // Initialization code
    
    
    profileImg.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    profileImg.layer.masksToBounds = YES;
    profileImg.layer.cornerRadius = profileImg.frame.size.height/2;
    profileImg.layer.borderColor = [UIColor whiteColor].CGColor;
    profileImg.layer.borderWidth = 3.0f;
    profileImg.layer.rasterizationScale = [UIScreen mainScreen].scale;
    profileImg.layer.shouldRasterize = YES;
    profileImg.clipsToBounds = YES;
    profileImg.userInteractionEnabled = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
