//
//  ServiceViewController.h
//  GoParking
//
//  Created by Shang Wang on 9/30/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@property (strong, nonatomic) IBOutlet UILabel *serviceLable;
@property (weak, nonatomic) IBOutlet UIImageView *bgIMG;
@property (weak, nonatomic) IBOutlet UIButton *driveServiceBtn;
-(void)setserviceLable: (NSString*) lable;
@end
