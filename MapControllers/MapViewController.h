//
//  MapViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by Shang Wang on 9/28/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
#import "REFrostedViewController.h"
#import "MyAnimatedAnnotationView.h"
#import "BDRecognizerViewController.h"
#import "BDRecognizerViewDelegate.h"
#import "BDVRFileRecognizer.h"
#import "BDVRDataUploader.h"
@interface MapViewController : UIViewController<BMKMapViewDelegate,UIGestureRecognizerDelegate,UISearchBarDelegate,BDRecognizerViewDelegate,BMKGeoCodeSearchDelegate>
@property (strong,nonatomic)IBOutlet BMKMapView* mapView;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *payButton;
@property (strong, nonatomic) NSMutableArray* annotatoinAry;
@property (strong, nonatomic)  UISearchBar *searchBar;
@property (strong, nonatomic) BMKGeoCodeSearch* geocodesearch;
@property NSMutableArray *themeArray;
@property (nonatomic, retain) BDRecognizerViewController *recognizerViewController;
@property (weak, nonatomic) IBOutlet UIView *preView;
@property (weak, nonatomic) IBOutlet UILabel *preViewTitle;
@property (weak, nonatomic) IBOutlet UILabel *preViewAddress;
@property (weak, nonatomic) IBOutlet UILabel *preViewAvailable;
@property (weak, nonatomic) IBOutlet UILabel *preViewTotal;
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;
@property (weak, nonatomic) IBOutlet UIButton *callBtn;
@property (weak, nonatomic) IBOutlet UIButton *voiceSearchBtn;
@property BOOL previewIsShow;
@property CLLocationCoordinate2D myLocation;
@end
