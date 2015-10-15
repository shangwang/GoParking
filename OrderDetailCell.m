//
//  OrderDetailCell.m
//  GoParking
//
//  Created by Shang Wang on 10/13/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import "OrderDetailCell.h"

@implementation OrderDetailCell
@synthesize MoreTimeBtn;
@synthesize NaviBtn;
@synthesize carInfo;
@synthesize timeLabel;
- (void)awakeFromNib {
    // Initialization code
    [MoreTimeBtn dangerStyle];
    [NaviBtn primaryStyle];
    
    carInfo.layer.cornerRadius=carInfo.frame.size.height/3;
    carInfo.clipsToBounds=YES;
    
    timeLabel.layer.cornerRadius=timeLabel.frame.size.height/3;
    timeLabel.clipsToBounds=YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
