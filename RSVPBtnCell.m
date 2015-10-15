//
//  RSVPBtnCell.m
//  GoParking
//
//  Created by Shang Wang on 10/12/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "RSVPBtnCell.h"
#import "UIButton+Bootstrap.h"
#import "OrderViewController.h"
#import "RSVPViewController.h"
@implementation RSVPBtnCell
@synthesize submitBtn;
@synthesize parentRSVP;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [submitBtn primaryStyle];
    // Configure the view for the selected state
}

- (IBAction)submit:(id)sender {
    OrderViewController* view= [[OrderViewController alloc]init];
    [parentRSVP.navigationController pushViewController:view animated:YES];
}

@end
