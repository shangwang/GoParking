//
//  ParkingLotInfoViewController.h
//  GoParking
//
//  Created by Shang Wang on 9/28/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
@interface ParkingLotInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet BMKMapView *PLMap;
@property (weak, nonatomic) IBOutlet UIButton *payButton;
@property (weak, nonatomic) IBOutlet UIButton *naviButton;
- (void)showAlertMessage;
@end
