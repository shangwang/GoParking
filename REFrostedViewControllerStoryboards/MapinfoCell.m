//
//  MapinfoCell.m
//  GoParking
//
//  Created by Shang Wang on 10/7/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import "MapinfoCell.h"

@implementation MapinfoCell
@synthesize preview;
@synthesize mapView;
- (void)awakeFromNib {
    // Initialization code
    
    preview.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8f];
    
    CALayer *upperBorder = [CALayer layer];
    //upperBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f]CGColor];
    upperBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f]CGColor];
    upperBorder.frame = CGRectMake(0, 0, CGRectGetWidth(preview.frame), 0.4f);
    [preview.layer addSublayer:upperBorder];
    [mapView setZoomLevel:17];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
