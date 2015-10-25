//
//  ServiceRSVPViewController.h
//  GoParking
//
//  Created by Shang Wang on 10/16/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceRSVPViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
-(void)changeFrame: (CGRect)frame;
@end
