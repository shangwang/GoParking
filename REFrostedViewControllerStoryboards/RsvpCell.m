//
//  RsvpCell.m
//  GoParking
//
//  Created by Shang Wang on 10/8/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import "RsvpCell.h"
#import "UIButton+Bootstrap.h"
#import "RSVPViewController.h"
@implementation RsvpCell
@synthesize RsvpBtn;
@synthesize NaviBtn;
@synthesize  parentParkingInfoController;
- (void)awakeFromNib {
    // Initialization code
    [RsvpBtn primaryStyle];
    [NaviBtn warningStyle];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    // Configure the view for the selected state
}
- (IBAction)reserve:(id)sender {
    
    RSVPViewController* rsvpCtl =[[RSVPViewController alloc]init];
    [parentParkingInfoController.navigationController pushViewController:rsvpCtl animated:YES];
}


- (IBAction)navigate:(id)sender {
    
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


@end
