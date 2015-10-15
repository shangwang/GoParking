//
//  OrderDoingViewController.h
//  GoParking
//
//  Created by Shang Wang on 10/14/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDoingViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
