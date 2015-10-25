//
//  ServiceRSVPDetailCell.h
//  GoParking
//
//  Created by Shang Wang on 10/16/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceRSVPDetailCell : UITableViewCell<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *PinLabel;
@property (weak, nonatomic) IBOutlet UILabel *PinText;
@property (weak, nonatomic) IBOutlet UIPickerView *HourPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *MinutePicker;
@property (strong, nonatomic)   NSArray *hourArray;
@property (strong, nonatomic)   NSArray *minuteArray;
@end
