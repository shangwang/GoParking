//
//  DEMOAppDelegate.h
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
#import "ZWIntroductionViewController.h"
@interface DEMOAppDelegate :  NSObject <UIApplicationDelegate,BMKGeneralDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
    BMKMapManager* _mapManager;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ZWIntroductionViewController *introductionView;
@end
