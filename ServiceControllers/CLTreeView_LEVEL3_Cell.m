//
//  CLTreeView_LEVEL3_Cell.m
//  GoParking
//
//  Created by Shang Wang on 10/5/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "CLTreeView_LEVEL3_Cell.h"
#import "HomeViewController.h"
@implementation CLTreeView_LEVEL3_Cell

@synthesize headImg;
@synthesize parentHomeView;
@synthesize parentTableView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
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

- (void)drawRect:(CGRect)rect
{
    int addX = _node.nodeLevel-1;
    addX = (addX<0?1:addX)*25; //根据节点所在的层次计算平移距离
    CGRect imgFrame = headImg.frame;
    imgFrame.origin.x = 14 + addX;
    headImg.frame = imgFrame;
    
    CGRect nameFrame = _name.frame;
    nameFrame.origin.x = 62 + addX;
    _name.frame = nameFrame;
    
    CGRect signtureFrame = _signture.frame;
    signtureFrame.origin.x = 62 + addX;
    _signture.frame = signtureFrame;
    
    
    [headImg setFrame:CGRectMake(headImg.frame.origin.x, headImg.frame.origin.y, 36, 36)];
    headImg.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    headImg.layer.masksToBounds = YES;
    headImg.layer.cornerRadius = 18;
    headImg.layer.borderColor = [UIColor whiteColor].CGColor;
    headImg.layer.borderWidth = 1.5f;
    headImg.layer.rasterizationScale = [UIScreen mainScreen].scale;
    headImg.layer.shouldRasterize = YES;
    headImg.clipsToBounds = YES;
}

@end
