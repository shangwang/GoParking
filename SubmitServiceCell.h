//
//  SubmitServiceCell.h
//  GoParking
//
//  Created by Shang Wang on 10/24/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ServiceRSVPViewController;
@interface SubmitServiceCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (strong, nonatomic) ServiceRSVPViewController* parentServiceRSVPCtr;
@end
