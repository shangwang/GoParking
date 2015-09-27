//
//  PayViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by Shang Wang on 9/18/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayViewController : UIViewController<UIAlertViewDelegate, UITextFieldDelegate>
{
    UIAlertView* mAlert;
    UITextField *mTextField;
}

@property(nonatomic, retain)NSString *channel;
@property(nonatomic ,retain)UITextField *mTextField;
- (void)showAlertWait;
- (void)showAlertMessage:(NSString*)msg;
- (void)hideAlert;

@end
