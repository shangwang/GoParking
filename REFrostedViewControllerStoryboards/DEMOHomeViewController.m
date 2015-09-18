//
//  DEMOHomeViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOHomeViewController.h"
#import <BaiduMapAPI/BMapKit.h>
@interface DEMOHomeViewController ()

@end

@implementation DEMOHomeViewController
@synthesize mainView;
- (IBAction)showMenu
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}


-(void)viewDidLoad{
    [super viewDidLoad];
    mainView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.jpg"]];
}


- (IBAction)clickOnNavigationButton:(id)sender {
     BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height-0.5)];
    [mainView addSubview:mapView];
    //mainView.layer.borderColor = [UIColor grayColor].CGColor;
    //mainView.layer.borderWidth = 0.5f;
    


}

@end
