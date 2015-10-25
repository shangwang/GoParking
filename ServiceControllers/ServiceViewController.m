//
//  ServiceViewController.m
//  GoParking
//
//  Created by Shang Wang on 9/30/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "ServiceViewController.h"
#import "DoubleViewController.h"
#import "FXBlurView.h"
@interface ServiceViewController ()

@property(strong,nonatomic) NSMutableArray* dataArray; //保存全部数据的数组
@property(strong,nonatomic) NSArray *displayArray;   //保存要显示在界面上的数据的数组
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
    FXBlurView *blurView = [[FXBlurView alloc] initWithFrame:self.view.frame];
    [blurView setDynamic:YES];
    [self.view addSubview:blurView];
    [self.view sendSubviewToBack:blurView];
    [self.view sendSubviewToBack:bgIMG];
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"back3"]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goback:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(-30, 0, 30, 30);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn] ;
    self.navigationItem.leftBarButtonItem = backButton;
}



-(void)goback:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
