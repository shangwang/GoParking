//
//  ParkingInfoController.h
//  GoParking
//
//  Created by Shang Wang on 10/24/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//
#import "Pingpp.h"
#import "PayViewController.h"
#import "UIButton+Bootstrap.h"
#import "HHAlertView.h"
#import "MapinfoCell.h"
#import "RsvpCell.h"
#import "PhotoCell.h"
#import "ServiceCell.h"



#import <UIKit/UIKit.h>

@interface ParkingInfoController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
