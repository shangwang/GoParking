//
//  CommentCell.m
//  GoParking
//
//  Created by Shang Wang on 10/24/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import "CommentCell.h"
#import "ServiceRSVPViewController.h"
@implementation CommentCell
@synthesize parentServiceRSVPCtr;
@synthesize commentTextView;
- (void)awakeFromNib {
    // Initialization code
    commentTextView.delegate=self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    UITableViewCell *cell;
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        // Load resources for iOS 6.1 or earlier
        cell = (UITableViewCell *) textView.superview.superview;
        
    } else {
        // Load resources for iOS 7 or later
        cell = (UITableViewCell *) textView.superview.superview;
        // TextField -> UITableVieCellContentView -> (in iOS 7!)ScrollView -> Cell!
    }
      [parentServiceRSVPCtr.tableView scrollToRowAtIndexPath:[parentServiceRSVPCtr.tableView indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}

@end
