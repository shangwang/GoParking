//
//  CommentCell.h
//  GoParking
//
//  Created by Shang Wang on 10/24/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ServiceRSVPViewController;
@interface CommentCell : UITableViewCell<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (strong, nonatomic) ServiceRSVPViewController* parentServiceRSVPCtr;
@end
