//
//  ParkingLotInfoViewController.m
//  GoParking
//
//  Created by Shang Wang on 9/28/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "ParkingLotInfoViewController.h"
#import "Pingpp.h"
#import "PayViewController.h"
#import "UIButton+Bootstrap.h"
#import "HHAlertView.h"
@interface ParkingLotInfoViewController ()

@end
@implementation ParkingLotInfoViewController
@synthesize PLMap;
@synthesize payButton;
@synthesize naviButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [payButton  infoStyle];
    [naviButton infoStyle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickOnNavigate:(id)sender {
   // [self openMapDrivingRoute];
    [self openNativeNavi];
}

- (IBAction)pay:(id)sender {
    PayViewController *payView=[[PayViewController alloc]initWithNibName:@"PayViewController" bundle:nil];
      payView.parentParkingInfoView=self;
    [self.navigationController pushViewController:payView animated:YES];
}


- (void)showAlertMessage
{
    [payButton setTitle:@"已支付" forState:UIControlStateNormal]; // To set the title
    [payButton setEnabled:NO]; // To toggle enabled / disabled
    [payButton successStyle];
    HHAlertView *alertview = [[HHAlertView alloc] initWithTitle:@"成功" detailText:@"付款成功" addView:self.view cancelButtonTitle:nil otherButtonTitles:@[@"确定"]];
    [alertview showWithBlock:^(NSInteger index) {
        NSLog(@"%ld",index);
    }];
}

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//打开客户端导航
- (void)openNativeNavi {
    //初始化调启导航时的参数管理类
    BMKNaviPara* para = [[BMKNaviPara alloc]init];
    //初始化起点节点
    BMKPlanNode* start = [[BMKPlanNode alloc]init];
    //指定起点经纬度
    CLLocationCoordinate2D coor1;
    coor1.latitude = 39.90868;
    coor1.longitude = 116.204;
    start.pt = coor1;
    //指定起点名称
    start.name = @"西直门";
    start.cityName = @"北京";
    //指定起点
    para.startPoint = start;
    
    //初始化终点节点
    BMKPlanNode* end = [[BMKPlanNode alloc]init];
    //指定终点经纬度
    CLLocationCoordinate2D coor2;
    coor2.latitude = 39.90868;
    coor2.longitude = 116.3956;
    end.pt = coor2;
    //指定终点名称
    end.name = @"天安门";
    end.cityName = @"北京";

    //指定终点
    para.endPoint = end;
    
    //指定返回自定义scheme
    para.appScheme = @"baidumapsdk://mapsdk.baidu.com";
    
    //调启百度地图客户端导航
    [BMKNavigation openBaiduMapNavigation:para];
}

- (void)openMapDrivingRoute {
    BMKOpenDrivingRouteOption *opt = [[BMKOpenDrivingRouteOption alloc] init];
    //    opt.appName = @"SDK调起Demo";
    opt.appScheme = @"baidumapsdk://mapsdk.baidu.com";
    //初始化起点节点
    BMKPlanNode* start = [[BMKPlanNode alloc]init];
    //指定起点经纬度
    CLLocationCoordinate2D coor1;
    coor1.latitude = 39.90868;
    coor1.longitude = 116.204;
    //指定起点名称
    start.name = @"西直门";
    start.cityName = @"北京";
    //指定起点
    opt.startPoint = start;
    
    //初始化终点节点
    BMKPlanNode* end = [[BMKPlanNode alloc]init];
    CLLocationCoordinate2D coor2;
    coor2.latitude = 39.90868;
    coor2.longitude = 116.3956;
    end.pt = coor2;
    //指定终点名称
    end.name = @"天安门";
    end.cityName = @"北京";
    opt.endPoint = end;
    BMKOpenErrorCode code = [BMKOpenRoute openBaiduMapDrivingRoute:opt];
    NSLog(@"%d", code);
    return;
}

@end
