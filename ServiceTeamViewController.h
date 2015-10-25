//
//  ServiceTeamViewController.h
//  GoParking
//
//  Created by Shang Wang on 10/15/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceTeamViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UITableView* myTableView;
-(void)changeFrame: (CGRect)frame;
@end
