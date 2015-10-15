//
//  ToDoCell.m
//  GoParking
//
//  Created by Shang Wang on 10/14/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "ToDoCell.h"
#import "UIButton+Bootstrap.h"
@implementation ToDoCell
@synthesize TypeLabel;
@synthesize profileImg;
@synthesize reviewBtn;
- (void)awakeFromNib {
    // Initialization code
    TypeLabel.layer.cornerRadius=TypeLabel.frame.size.height/3;
    TypeLabel.clipsToBounds=YES;
    profileImg.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    profileImg.layer.masksToBounds = YES;
    profileImg.layer.cornerRadius = profileImg.frame.size.width/2;
    profileImg.layer.borderColor = [UIColor whiteColor].CGColor;
    profileImg.layer.borderWidth = 3.0f;
    profileImg.layer.rasterizationScale = [UIScreen mainScreen].scale;
    profileImg.layer.shouldRasterize = YES;
    profileImg.clipsToBounds = YES;
    profileImg.userInteractionEnabled = YES;
    
    [reviewBtn warningStyle];
    [reviewBtn setHidden:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
