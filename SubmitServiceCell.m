//
//  SubmitServiceCell.m
//  GoParking
//
//  Created by Shang Wang on 10/24/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import "SubmitServiceCell.h"
#import "UIButton+Bootstrap.h"
@implementation SubmitServiceCell
@synthesize parentServiceRSVPCtr;
@synthesize submitBtn;
- (void)awakeFromNib {
    // Initialization code
    [submitBtn primaryStyle];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)submit:(id)sender {
}





@end
