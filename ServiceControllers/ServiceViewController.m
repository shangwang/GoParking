//
//  ServiceViewController.m
//  GoParking
//
//  Created by Shang Wang on 9/30/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "ServiceViewController.h"
#import "DoubleViewController.h"
@interface ServiceViewController ()

@end

@implementation ServiceViewController
@synthesize bgImg;
@synthesize serviceLable;
@synthesize bgIMG;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.alpha=0.5;
    visualEffectView.frame=bgImg.frame;
    [bgImg addSubview:visualEffectView];
    [self.view sendSubviewToBack:bgIMG];
}
-(void)setserviceLable: (NSString*) lable{
    serviceLable.text=lable;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)driveService:(id)sender {
    DoubleViewController* list=[[DoubleViewController alloc]init];
    [self.navigationController pushViewController:list animated:YES];
    
    
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
