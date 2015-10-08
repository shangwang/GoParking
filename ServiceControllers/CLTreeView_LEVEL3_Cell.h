//
//  CLTreeView_LEVEL3_Cell.h
//  GoParking
//
//  Created by Shang Wang on 10/5/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLTreeViewNode.h"
@class HomeViewController;
@interface CLTreeView_LEVEL3_Cell : UITableViewCell

@property (retain,strong,nonatomic) CLTreeViewNode *node;//data
@property (strong,nonatomic) IBOutlet UIImageView *headImg;
@property (strong,nonatomic) IBOutlet UILabel *signture;//个性签名
@property (strong,nonatomic) IBOutlet UILabel *name;
@property HomeViewController* parentHomeView;
@property UITableView* parentTableView;
@end