//
//  RSVPTitleCell.m
//  GoParking
//
//  Created by Shang Wang on 10/12/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "RSVPTitleCell.h"

@implementation RSVPTitleCell
@synthesize LotImage;
- (void)awakeFromNib {
    // Initialization code
    
    LotImage.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    LotImage.layer.masksToBounds = YES;
    LotImage.layer.cornerRadius = 23;
    LotImage.layer.borderColor = [UIColor whiteColor].CGColor;
    LotImage.layer.borderWidth = 2.0f;
    LotImage.layer.rasterizationScale = [UIScreen mainScreen].scale;
    LotImage.layer.shouldRasterize = YES;
    LotImage.clipsToBounds = YES;
    LotImage.userInteractionEnabled = YES;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
