//
//  OrderTitleCell.m
//  GoParking
//
//  Created by Shang Wang on 10/13/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "OrderTitleCell.h"

@implementation OrderTitleCell
@synthesize idLabel;
@synthesize timeLabel;
- (void)awakeFromNib {
    // Initialization code
    idLabel.layer.cornerRadius=idLabel.frame.size.height/3;
    idLabel.clipsToBounds=YES;
    
    timeLabel.layer.cornerRadius=timeLabel.frame.size.height/3;
    timeLabel.clipsToBounds=YES;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
