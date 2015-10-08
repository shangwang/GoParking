//
//  NotificattionViewController.h
//  GoParking
//
//  Created by Shang Wang on 10/6/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificattionViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *notificationTableView;

@end
