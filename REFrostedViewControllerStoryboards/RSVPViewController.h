//
//  RSVPViewController.h
//  GoParking
//
//  Created by Shang Wang on 10/12/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ParkingLotInfoViewController.h"
#import "Pingpp.h"
#import "PayViewController.h"
#import "UIButton+Bootstrap.h"
#import "HHAlertView.h"
#import "MapinfoCell.h"
#import "RsvpCell.h"
#import "PhotoCell.h"
#import "ServiceCell.h"

@interface RSVPViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
//@property(strong, nonatomic)  UIView *view;
@end
