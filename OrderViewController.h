//
//  OrderViewController.h
//  GoParking
//
//  Created by Shang Wang on 10/12/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
//@property(strong, nonatomic)  UIView *view;
@end
