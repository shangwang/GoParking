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
#import "CJSONDeserializer.h"
@interface HomeViewController : UIViewController<NSURLConnectionDataDelegate>
@property (strong, nonatomic) NSString* userName;
@property (strong, nonatomic) NSString* userNickName;

- (IBAction)showMenu;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) NSData* m_JsonData;
- (IBAction)clickOnNavigationButton:(id)sender;
-(void)connectToLogIn: (NSString*) userName paswd: (NSString*)passWord;
@end