//
//  MapinfoCell.h
//  GoParking
//
//  Created by Shang Wang on 10/7/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>
@interface MapinfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *preview;
@property (weak, nonatomic) IBOutlet BMKMapView *mapView;
@end
