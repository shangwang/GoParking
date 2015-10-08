//
//  userInfoViewController.h
//  GoParking
//
//  Created by Shang Wang on 10/2/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userInfoViewController : UIViewController <UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property UIImage* profileImage;
@property (weak, nonatomic) IBOutlet UIImageView *userImg;
@end
