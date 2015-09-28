
//  DEMOHomeViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "HomeViewController.h"
#import <BaiduMapAPI/BMapKit.h>
#import "Pingpp.h"
#import "LogInViewController.h"
@interface HomeViewController ()
@end
@implementation HomeViewController
@synthesize mainView;
@synthesize userName;
@synthesize userNickName;
@synthesize m_JsonData;
#define kServerUrl @"http://218.244.151.190/demo/charge"
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
    //check login
    BOOL hasLoginKey = [[NSUserDefaults standardUserDefaults] boolForKey:@"HasLogInKey"];
    if(!hasLoginKey){
        LogInViewController *payView=[[LogInViewController alloc]initWithNibName:@"LogInViewController" bundle:nil];
        [self.navigationController pushViewController:payView animated:NO];
    }else{//get the saved login information
        
    }
    //setting up connection with server
    NSURL *url = [NSURL URLWithString:@"http://101.200.192.56/ParkInfo/GetParkInfo/4"];
    NSURLRequest    *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    NSURLConnection *urlConnection = [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    [urlConnection start];
}

-(void)connectToLogIn: (NSString*) userName paswd: (NSString*)passWord{
    
}

- (IBAction)clickOnNavigationButton:(id)sender {
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height-0.5)];
    [mainView addSubview:mapView];
}

- (IBAction)clickOnPayButton:(id)sender {
    
    PayViewController *payView=[[PayViewController alloc]initWithNibName:@"PayViewController" bundle:nil];
    //PayViewController *payView= [[PayViewController alloc]init];
    [self.navigationController pushViewController:payView animated:YES];
    
}

#pragma mark - NSURLConnectionDataDelegate methods
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView * alertV = [[UIAlertView alloc] initWithTitle:@"网络连接失败" message:[NSString  stringWithFormat:@"%@",error] delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alertV show];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //这里我们终于拿到了网络返回的 JSON 数据 data
    m_JsonData = data;
    //NSString* txt = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:data error:&error];
}

@end