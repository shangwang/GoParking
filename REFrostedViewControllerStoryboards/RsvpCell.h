//
//  RsvpCell.h
//  GoParking
//
//  Created by Shang Wang on 10/8/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
@class  ParkingLotInfoViewController;
@interface RsvpCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *RsvpBtn;
@property (weak, nonatomic) IBOutlet UIButton *NaviBtn;
@property ParkingLotInfoViewController* parentParkingInfoController;
@end
