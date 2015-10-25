//
//  ServiceRSVPDetailCell.m
//  GoParking
//
//  Created by Shang Wang on 10/16/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "ServiceRSVPDetailCell.h"
#import "UIButton+Bootstrap.h"
@implementation ServiceRSVPDetailCell
@synthesize TimeLabel;
@synthesize PinLabel;
@synthesize PinText;
@synthesize HourPicker;
@synthesize MinutePicker;
@synthesize hourArray;
@synthesize minuteArray;

- (void)awakeFromNib {
    // Initialization code
    PinLabel.layer.cornerRadius=PinLabel.frame.size.height/3;
    PinLabel.clipsToBounds=YES;
    TimeLabel.layer.cornerRadius=TimeLabel.frame.size.height/3;
    TimeLabel.clipsToBounds=YES;
    HourPicker.delegate=self;
    HourPicker.dataSource=self;
    HourPicker.tag=0;
    MinutePicker.delegate=self;
    MinutePicker.tag=1;
    MinutePicker.dataSource=self;
    self.hourArray  = [[NSArray alloc]         initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18" ,@"19",@"20",@"21",@"22",@"23",@"24" , nil];
    self.minuteArray  = [[NSArray alloc]         initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18" ,@"19",@"20",@"21",@"22",@"23",@"24" ,@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42" ,@"43",@"44",@"45",@"46",@"47",@"48" ,@"49",@"50",@"52",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"60", nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    if(0==pickerView.tag){
        return 24;
    }
    else{
        return 60;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    if(0==pickerView.tag){
        return [self.hourArray objectAtIndex:row];
    }
    else{
        return [self.minuteArray objectAtIndex:row];
    }
    
}




@end
