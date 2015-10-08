//
//  MapViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Shang Wang on 9/28/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//
#import "ParkingLotInfoViewController.h"
#import "MapViewController.h"


#import "BDVoiceRecognitionClient.h"
#import "BDVRSConfig.h"
#import "BDVRUIPromptTextCustom.h"
#import "BDVRLogger.h"
#import "BDRecognizerViewController.h"
#import "BDRecognizerViewDelegate.h"
#import "BDVRFileRecognizer.h"
#import "BDVRDataUploader.h"
#define API_KEY @"gSBMabfRftHwUgxzFNjQZMAq" // 请修改为您在百度开发者平台申请的API_KEY
#define SECRET_KEY @"GAQZF687IQxMztYG7K64HGAMkozEdnYX" // 请修改您在百度开发者平台申请的SECRET_KEY


@interface MapViewController (){
       bool isGeoSearch;
}
@end

@implementation MapViewController
@synthesize mapView;
@synthesize menuButton;
@synthesize payButton;
@synthesize annotatoinAry;
@synthesize searchBar;
@synthesize recognizerViewController;
@synthesize themeArray;
@synthesize geocodesearch;
@synthesize preView;
@synthesize preViewAddress;
@synthesize preViewAvailable;
@synthesize preViewTitle;
@synthesize preViewTotal;


- (id) init {
    if (self = [super init]) {
        annotatoinAry=[[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    geocodesearch = [[BMKGeoCodeSearch alloc]init];
    geocodesearch.delegate=self;
    [menuButton setFrame:CGRectMake(menuButton.frame.origin.x, menuButton.frame.origin.y, menuButton.frame.size.height, menuButton.frame.size.height)];
    self.frostedViewController.panGestureEnabled=NO;
    mapView.delegate=self;
    self.navigationController.navigationBar.alpha=0.8;
       
    searchBar = [UISearchBar new];
    [searchBar setFrame:CGRectMake(searchBar.frame.origin.x-self.navigationController.navigationBar.frame.size.width*0.07+40, searchBar.frame.origin.y, self.navigationController.navigationBar.frame.size.width*0.65, searchBar.frame.size.height)];
    menuButton.alpha=0.7;
    [searchBar setTranslucent:YES];
    searchBar.showsBookmarkButton=YES;
    UIImage *bookMark=[UIImage imageNamed:@"voiceIcon"];
    UIImage *myIcon = [MapViewController imageWithImage:bookMark scaledToSize:CGSizeMake(searchBar.frame.size.height*0.8, searchBar.frame.size.height*0.8)];
    
    [searchBar setImage:bookMark forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
 
    searchBar.placeholder=@"搜索停车场";
    [searchBar setBackgroundImage:[UIImage new]];
    searchBar.alpha=0.7;
    searchBar.delegate=self;
    searchBar.showsCancelButton = NO;
    [searchBar sizeToFit];
    
    UIView *barWrapper = [[UIView alloc]initWithFrame:searchBar.bounds];
    [barWrapper addSubview:searchBar];
    self.navigationItem.titleView = barWrapper;
    
    
    themeArray = [[NSMutableArray alloc] init];
    
    if ([BDTheme lightBlueTheme])
    {
        [themeArray addObject:[BDTheme lightBlueTheme]];
    }
    if ([BDTheme lightGreenTheme])
    {
        [themeArray addObject:[BDTheme lightGreenTheme]];
    }
    if ([BDTheme lightOrangeTheme])
    {
        [themeArray addObject:[BDTheme lightOrangeTheme]];
    }
    //[BDVRSConfig sharedInstance].theme = [themeArray objectAtIndex:0];
    preView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8f];
    
    CALayer *upperBorder = [CALayer layer];
    //upperBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f]CGColor];
    upperBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f]CGColor];
    upperBorder.frame = CGRectMake(0, 0, CGRectGetWidth(preView.frame), 0.4f);
    [preView.layer addSublayer:upperBorder];
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(previewSingleTap:)];
    [preView addGestureRecognizer:singleFingerTap];
    [preView setHidden:YES];

}


- (void)previewSingleTap:(UITapGestureRecognizer *)recognizer {
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main"
                                                  bundle:nil];
    UIViewController* vc = [sb instantiateViewControllerWithIdentifier:@"ParkingLotInfoViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}




- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar {
    
    // 创建识别控件
    BDRecognizerViewController *tmpRecognizerViewController = [[BDRecognizerViewController alloc] initWithOrigin:CGPointMake(35, 128) withTheme:nil];
    //BDRecognizerViewController *tmpRecognizerViewController = [[BDRecognizerViewController alloc] initWithOrigin:CGPointMake([[UIApplication sharedApplication] keyWindow].frame.size.width/10, 128) withTheme:nil];
     recognizerViewController = tmpRecognizerViewController;
    tmpRecognizerViewController.delegate=self;
    
    // 设置识别参数
    BDRecognizerViewParamsObject *paramsObject = [[BDRecognizerViewParamsObject alloc] init];
    
    // 开发者信息，必须修改API_KEY和SECRET_KEY为在百度开发者平台申请得到的值，否则示例不能工作
    paramsObject.apiKey = API_KEY;
    paramsObject.secretKey = SECRET_KEY;
    
    // 设置是否需要语义理解，只在搜索模式有效
    paramsObject.isNeedNLU = [BDVRSConfig sharedInstance].isNeedNLU;
    
    // 设置识别语言
    paramsObject.language = [BDVRSConfig sharedInstance].recognitionLanguage;
    
    // 设置识别模式，分为搜索和输入
    paramsObject.recogPropList = @[[BDVRSConfig sharedInstance].recognitionProperty];
    
    // 设置城市ID，当识别属性包含EVoiceRecognitionPropertyMap时有效
    paramsObject.cityID = 1;
    
    // 开启联系人识别
    //    paramsObject.enableContacts = YES;
    
    // 设置显示效果，是否开启连续上屏
    if ([BDVRSConfig sharedInstance].resultContinuousShow)
    {
        paramsObject.resultShowMode = BDRecognizerResultShowModeContinuousShow;
    }
    else
    {
        paramsObject.resultShowMode = BDRecognizerResultShowModeWholeShow;
    }
    
    // 设置提示音开关，是否打开，默认打开
    if ([BDVRSConfig sharedInstance].uiHintMusicSwitch)
    {
        paramsObject.recordPlayTones = EBDRecognizerPlayTonesRecordPlay;
    }
    else
    {
        paramsObject.recordPlayTones = EBDRecognizerPlayTonesRecordForbidden;
    }
    
    paramsObject.isShowTipAfterSilence = NO;
    paramsObject.isShowHelpButtonWhenSilence = NO;
    paramsObject.tipsTitle = @"可以使用如下指令记账";
    paramsObject.tipsList = [NSArray arrayWithObjects:@"我要记账", @"买苹果花了十块钱", @"买牛奶五块钱", @"第四行滚动后可见", @"第五行是最后一行", nil];
    [recognizerViewController startWithParams:paramsObject];
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


-(void)viewWillAppear:(BOOL)animated{
    [self removeAllAnnotation];
}
-(void)viewDidAppear:(BOOL)animated{
    [self addTestAnnotation];
}

- (IBAction)showMenu:(id)sender {
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    [self.frostedViewController presentMenuViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickOnPay:(id)sender {
    [self addPointAnnotation:@"蓝翔停车" price:@"￥12" Coordinate:mapView.centerCoordinate];
}

- (void)addPointAnnotation: (NSString*)name price: (NSString*)price Coordinate: (CLLocationCoordinate2D) coor
{
    BMKPointAnnotation* pointAnnotation;
    pointAnnotation = [[BMKPointAnnotation alloc]init];
   // CLLocationCoordinate2D coor;
    coor.latitude -= 0.15;
    coor.longitude -=0.15;
    float r = arc4random_uniform(100)/0.99;
    float r2 = arc4random_uniform(100)/0.99;
    int plus=arc4random_uniform(1);
    if(0==plus){
        coor.latitude+=r/300;
    }else{
        coor.latitude-=r/300;
    }
    int log=arc4random_uniform(1);
    if(0==log){
        coor.longitude+=r2/300;
    }else{
        coor.longitude-=r2/300;
    }
    pointAnnotation.coordinate = coor;
    pointAnnotation.title = name;
    pointAnnotation.subtitle = price;
    [annotatoinAry addObject:pointAnnotation];
    [mapView addAnnotation:pointAnnotation];
    BMKAnnotationView* anoView=[mapView viewForAnnotation:pointAnnotation];
    UIImage* anoIMG= [UIImage imageNamed:@"marker_blue"];
    
    anoView.image=[MapViewController imageWithImage:anoIMG scaledToSize:CGSizeMake(38, 38)];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [anoView addGestureRecognizer:singleFingerTap];
    
    UILabel *yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(9, 6, 30, 15)];
    int rprice = arc4random_uniform(30);
    NSString* priceString= [[NSString alloc]initWithFormat:@"￥%d",rprice];
    yourLabel.text=priceString;
    [yourLabel setTextColor:[UIColor colorWithRed:68/255.0f green:163/255.0f blue:211/255.0f alpha:1.0f]];
    [yourLabel setBackgroundColor:[UIColor clearColor]];
    [yourLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 9.0f]];
    [anoView addSubview:yourLabel];
    
    
}


- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    UIImage* anoIMG= [UIImage imageNamed:@"marker_blue"];
    for (BMKPointAnnotation* ano in annotatoinAry) {
        BMKAnnotationView* anoView=[mapView viewForAnnotation:ano];
         anoView.image=[MapViewController imageWithImage:anoIMG scaledToSize:CGSizeMake(40, 40)];
        
        for (UIView *subview in anoView.subviews)
        {
            if([subview isKindOfClass:[UILabel class]]){
                UILabel *textView = (UILabel*)subview;
                [textView setTextColor:[UIColor colorWithRed:68/255.0f green:163/255.0f blue:211/255.0f alpha:1.0f]];
               [textView setFrame:CGRectMake(9, 6, 30, 15)];
                [textView setFont:[UIFont fontWithName: @"Trebuchet MS" size: 9.0f]];
            }
        }
    }
    anoIMG= [UIImage imageNamed:@"marker_orange"];
    
    [preView setHidden:NO];
    BMKAnnotationView* anoView=(BMKAnnotationView*)recognizer.view;
    anoView.image=[MapViewController imageWithImage:anoIMG scaledToSize:CGSizeMake(40*1.4,40*1.4)];
    
    
    BMKPointAnnotation* pointAnnotation=anoView.annotation;
    preViewTitle.text=pointAnnotation.title;
    int r2 = arc4random_uniform(45);
    preViewAvailable.text=[[NSString alloc]initWithFormat:@"%d",r2];
    
    for (UIView *subview in anoView.subviews)
    {
        if([subview isKindOfClass:[UILabel class]]){
            UILabel *textView = (UILabel*)subview;
            [textView setTextColor:[UIColor orangeColor]];
            [textView setFrame:CGRectMake(13, 12, 35, 15)];
            [textView setFont:[UIFont fontWithName: @"Trebuchet MS" size: 13.0f]];
        }
    }
    
    //Do stuff here...
}

-(void)removeAllAnnotation{
    for (BMKPointAnnotation* annotation in annotatoinAry) {
        [mapView removeAnnotation:annotation];
    }
    annotatoinAry=[[NSMutableArray alloc] init];
}

#pragma mark -
#pragma mark implement BMKMapViewDelegate

// 根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    //普通annotation
    NSString *AnnotationViewID = @"renameMark";
    BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        // 设置颜色
        annotationView.pinColor = BMKPinAnnotationColorPurple;
        // 从天上掉下效果
        annotationView.animatesDrop = YES;
        // 设置可拖拽
        annotationView.draggable = YES;
    }
    return annotationView;
}

// 当点击annotation view弹出的泡泡时，调用此接口
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view;
{
    NSLog(@"paopaoclick");
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main"
                                                  bundle:nil];
    UIViewController* vc = [sb instantiateViewControllerWithIdentifier:@"ParkingLotInfoViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}





#pragma mark -Geosearch Delegate
-(void)searchGeocode: (NSString*)city adr: (NSString*)adress
{
    isGeoSearch = true;
    BMKGeoCodeSearchOption *geocodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
    geocodeSearchOption.city= city;
    geocodeSearchOption.address = adress;
    BOOL flag = [geocodesearch geoCode:geocodeSearchOption];
    if(flag)
    {
        NSLog(@"geo检索发送成功");
    }
    else
    {
        NSLog(@"geo检索发送失败");
    }
}


- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    NSArray* array = [NSArray arrayWithArray:mapView.annotations];
    [mapView removeAnnotations:array];
    array = [NSArray arrayWithArray:mapView.overlays];
    [mapView removeOverlays:array];
    if (error == 0) {
        BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
        item.coordinate = result.location;
        item.title = result.address;
        [mapView addAnnotation:item];
         mapView.centerCoordinate = result.location;
        [mapView setZoomLevel:12];
    }
    [self addTestAnnotation];
}


-(void)addTestAnnotation{
    [self addPointAnnotation:@"人民路停车场" price:@"￥ 30" Coordinate:mapView.centerCoordinate];
    [self addPointAnnotation:@"华联停车场" price:@"￥ 30" Coordinate:mapView.centerCoordinate];
    [self addPointAnnotation:@"工人路停车场" price:@"￥ 30" Coordinate:mapView.centerCoordinate];
    [self addPointAnnotation:@"天安门停车场" price:@"￥ 30" Coordinate:mapView.centerCoordinate];
    [self addPointAnnotation:@"外滩停车场" price:@"￥ 30" Coordinate:mapView.centerCoordinate];
    [self addPointAnnotation:@"南京路停车场" price:@"￥ 30" Coordinate:mapView.centerCoordinate];
    [self addPointAnnotation:@"越秀停车场" price:@"￥ 30" Coordinate:mapView.centerCoordinate];
    [self addPointAnnotation:@"古乐停车场" price:@"￥ 30" Coordinate:mapView.centerCoordinate];
    [self addPointAnnotation:@"飞跃停车场" price:@"￥ 30" Coordinate:mapView.centerCoordinate];
    [self addPointAnnotation:@"尼玛停车场" price:@"￥ 30" Coordinate:mapView.centerCoordinate];
}


#pragma mark - BDRecognizerViewDelegate

- (void)onEndWithViews:(BDRecognizerViewController *)aBDRecognizerView withResults:(NSArray *)aResults
{
    
    
    if ([[BDVoiceRecognitionClient sharedInstance] getRecognitionProperty] != EVoiceRecognitionPropertyInput)
    {
        // 搜索模式下的结果为数组，示例为
        // ["公园", "公元"]
        NSMutableArray *audioResultData = (NSMutableArray *)aResults;
        NSMutableString *tmpString = [[NSMutableString alloc] initWithString:@""];
        [tmpString appendFormat:@"%@",[audioResultData objectAtIndex:0]];
        /* get //all possible result
        for (int i=0; i < [audioResultData count]; i++)
        {
            [tmpString appendFormat:@"%@\r\n",[audioResultData objectAtIndex:i]];
        }*/
        [self searchGeocode:@"" adr:tmpString];
       // NSLog(tmpString);
        
    }
    else
    {

        NSString *tmpString = [[BDVRSConfig sharedInstance] composeInputModeResult:aResults];

    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
