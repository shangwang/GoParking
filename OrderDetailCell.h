//
//  OrderDetailCell.h
//  GoParking
//
//  Created by Shang Wang on 10/13/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Bootstrap.h"
@interface OrderDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *carInfo;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *MoreTimeBtn;
@property (weak, nonatomic) IBOutlet UIButton *NaviBtn;

@end
