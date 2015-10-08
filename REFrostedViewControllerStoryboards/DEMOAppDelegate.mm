//
//  DEMOAppDelegate.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOAppDelegate.h"
#import "Pingpp.h"
#import "LogInViewController.h"
#import "PayViewController.h"
#import "ZWIntroductionViewController.h"
#import "REFrostedViewController.h"
#import "ListViewController.h"
@implementation DEMOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    

    _mapManager = [[BMKMapManager alloc]init];
    navigationController=[[UINavigationController alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"gSBMabfRftHwUgxzFNjQZMAq"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    // Add the navigation controller's view to the window and display.
   // [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    
    // Added Introduction View Controller
    NSArray *coverImageNames = @[@"img_index_01txt", @"img_index_02txt", @"img_index_03txt"];
    NSArray *backgroundImageNames = @[@"img_index_01bg", @"img_index_02bg", @"img_index_03bg"];
    self.introductionView = [[ZWIntroductionViewController alloc] initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isIntroduced"] ){
    [self.window addSubview:self.introductionView.view];
    }
    __weak DEMOAppDelegate *weakSelf = self;
    self.introductionView.didSelectedEnter = ^() {
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"isIntroduced"];
        [weakSelf.introductionView.view removeFromSuperview];
        weakSelf.introductionView = nil;
        
    };

    
    return YES;
 
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [Pingpp handleOpenURL:url withCompletion:^(NSString *result, PingppError *error) {
        NSLog(@"result = %@, error : %@", result, error == nil ? @"nil" : [error getMsg]);
        REFrostedViewController* REFview=(REFrostedViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;
        UINavigationController* nav=(UINavigationController*)REFview.contentViewController;
        PayViewController* pay=(PayViewController*)nav.visibleViewController;
         [pay finishPayment];
    }];
    return YES;
}

@end
