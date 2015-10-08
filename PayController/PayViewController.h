//
//  PayViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by Shang Wang on 9/18/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ParkingLotInfoViewController;
@interface PayViewController : UIViewController<UIAlertViewDelegate, UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIAlertView* mAlert;
    UITextField *mTextField;
}

@property(nonatomic, retain)NSString *channel;
@property(nonatomic ,retain)UITextField *mTextField;
@property(nonatomic ,retain)ParkingLotInfoViewController *parentParkingInfoView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (strong, nonatomic)NSArray *dataSourceArray;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;
@property float firstHourRate;
@property float halfHourRate;
- (void)showAlertWait;
- (void)showAlertMessage:(NSString*)msg;
- (void)hideAlert;
-(void)finishPayment;
@end
