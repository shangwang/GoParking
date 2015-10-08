//
//  CLTreeView_LEVEL2_Cell.m
//  CLTreeView
//
//  Created by 钟由 on 14-9-9.
//  Copyright (c) 2014年 flywarrior24@163.com. All rights reserved.
//

#import "CLTreeView_LEVEL2_Cell.h"

@implementation CLTreeView_LEVEL2_Cell
@synthesize headImg;
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

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
