//
//  RSVPBtnCell.h
//  GoParking
//
//  Created by Shang Wang on 10/12/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RSVPViewController;
@interface RSVPBtnCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (strong, nonatomic) RSVPViewController* parentRSVP;
@end
