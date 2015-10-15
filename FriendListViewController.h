//
//  FriendListViewController.h
//  GoParking
//
//  Created by Shang Wang on 10/8/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView* myTableView;
-(void)changeFrame: (CGRect)frame;
@end
