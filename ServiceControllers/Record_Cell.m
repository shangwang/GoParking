//
//  Record_Cell.m
//  GoParking
//
//  Created by Shang Wang on 10/5/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "Record_Cell.h"
#import "HomeViewController.h"
@implementation Record_Cell
@synthesize parentTableView;
@synthesize parentHomeView;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)close:(id)sender {
    if(parentTableView==nil){
        return;
    }
      NSIndexPath* path = [parentTableView indexPathForCell:self];
    [parentHomeView deleteCell:path];

}


@end
