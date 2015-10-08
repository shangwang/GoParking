//
//  CLTreeView_LEVEL3_Model.h
//  GoParking
//
//  Created by Shang Wang on 10/5/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLTreeViewNode.h"

@interface CLTreeView_LEVEL3_Model : NSObject
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *signture;
@property (strong,nonatomic) NSString *headImgPath;//本地图片名,若不为空则优先于远程图片加载
@property (strong,nonatomic) NSURL *headImgUrl;//远程图片链接

@end
