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
#import "MapinfoCell.h"
#import "RsvpCell.h"
#import "PhotoCell.h"
#import "ServiceCell.h"
#import "RSVPViewController.h"
@interface ParkingLotInfoViewController ()

@end
@implementation ParkingLotInfoViewController
@synthesize PLMap;
@synthesize payButton;
@synthesize naviButton;
@synthesize preView;
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [payButton  infoStyle];
    [naviButton infoStyle];
    preView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8f];
    self.view.backgroundColor=[UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1.0f];
    
    CALayer *upperBorder = [CALayer layer];
    upperBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f]CGColor];
    upperBorder.frame = CGRectMake(0, 0, CGRectGetWidth(preView.frame), 0.5f);
    [preView.layer addSublayer:upperBorder];
    
    CALayer *lowerBorder = [CALayer layer];
    lowerBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f]CGColor];
    lowerBorder.frame = CGRectMake(0, CGRectGetHeight(preView.frame), CGRectGetWidth(preView.frame), 0.3f);
    [preView.layer addSublayer:lowerBorder];
    [PLMap setZoomLevel:15];
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.allowsSelection=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickOnNavigate:(id)sender {
    RSVPViewController* rsvpCtl =[[RSVPViewController alloc]init];
    [self.navigationController pushViewController:rsvpCtl animated:YES];
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
        //NSLog(@"%ld",index);
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


#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if(indexPath.row==0&&0==indexPath.section){
        return 256;
    }
    
    if(indexPath.row==0&&1==indexPath.section){
        return 105;
    }
    if(indexPath.row==0&&2==indexPath.section){
        PhotoCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"PhotoCell" owner:self options:nil] lastObject];
        return cell.frame.size.height;
    }

    if(indexPath.row==0&&3==indexPath.section){
        ServiceCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ServiceCell" owner:self options:nil] lastObject];
        return cell.frame.size.height;
    }

    return 45;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0&&0==indexPath.section){
        MapinfoCell * cell= [tableView dequeueReusableCellWithIdentifier:@"MapinfoCell"];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MapinfoCell" owner:self options:nil] lastObject];
        }
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        return cell;
    }else if (0==indexPath.row&&1==indexPath.section){
        RsvpCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"RsvpCell" owner:self options:nil] lastObject];
        cell.parentParkingInfoController=self;
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        return cell;
    }
    else if (0==indexPath.row&&2==indexPath.section){
        PhotoCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"PhotoCell" owner:self options:nil] lastObject];
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        return cell;
    }
    else if (0==indexPath.row&&3==indexPath.section){
        ServiceCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ServiceCell" owner:self options:nil] lastObject];
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        return cell;
    }
    else{
        static NSString *cellIdentifier = @"Cell";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
    view.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1.0f];
    CALayer *upperBorder = [CALayer layer];
    upperBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f]CGColor];
    upperBorder.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), 0.4f);
    [view.layer addSublayer:upperBorder];
    CALayer *lowerBorder = [CALayer layer];
    lowerBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f] CGColor];
    lowerBorder.frame = CGRectMake(0, view.frame.size.height, CGRectGetWidth(view.frame),0.4f);
    [view.layer addSublayer:lowerBorder];
    /* Create custom view to display section header... */
    return view;
}


@end
