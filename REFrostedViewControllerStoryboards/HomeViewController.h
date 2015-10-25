//
//  DEMOHomeViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "PayViewController.h"
#import "JKPopMenuView.h"
#import "QRCodeReaderDelegate.h"
#import "FXBlurView.h"


@interface HomeViewController : UIViewController<NSURLConnectionDataDelegate,JKPopMenuViewSelectDelegate,UITableViewDataSource,UITableViewDelegate,QRCodeReaderDelegate>
@property (weak, nonatomic) IBOutlet UIButton *scanButton;
@property (strong, nonatomic) NSString* userName;
@property (strong, nonatomic) NSString* userNickName;
@property (weak, nonatomic) IBOutlet UIButton *fingParkingButton;
@property (weak, nonatomic) IBOutlet UIButton *serviceButton;
@property (weak, nonatomic) IBOutlet UIButton *menuIcon;
@property (strong, nonatomic) NSArray *serviceListArray;
@property NSMutableArray *serviceItemArray;
@property (weak, nonatomic) IBOutlet UITableView *notificationTableView;
@property int dataCount;
- (IBAction)showMenu;
@property FXBlurView *blurEffectView;

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) NSData* m_JsonData;
- (IBAction)clickOnNavigationButton:(id)sender;
-(void)connectToLogIn: (NSString*) userName paswd: (NSString*)passWord;
-(void)deleteCell: (NSIndexPath *)indexPath;
@end