//
//  LogInViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Shang Wang on 9/25/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "LogInViewController.h"

#import "MapViewController.h"
@interface LogInViewController ()

@end

@implementation LogInViewController
@synthesize bgImg;
@synthesize userNameTextField;
@synthesize passWordTextField;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
     [self.navigationController setNavigationBarHidden:YES animated:YES];
    // Do any additional setup after loading the view from its nib.
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.alpha=0.5;
    visualEffectView.frame=bgImg.frame;
    [bgImg addSubview:visualEffectView];
    //[bgImg setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    userNameTextField.alpha=0.5;
    //[userNameTextField setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    passWordTextField.alpha=0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickOnLogIn:(id)sender {
    /*
    NSString *userName=userNameTextField.text;
    NSString *password=passWordTextField.text;
    if(0==userName.length||0==password.length){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"User name or password can not be empty." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString* urlString=[[NSString alloc] initWithFormat:@"http://101.200.192.56/Member/LoginMember?UserName=%@&Password=%@", userName,password];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
                    NSString *msgString=weatherDic[@"Msg"];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if ([[NSThread currentThread] isMainThread]){
                            if([msgString isEqualToString:@"没有查找到该数据"]){
                                NSLog(@"LoginFail");
                                [self showalert];
                            }else{
                                NSLog(@"Success");
                                 NSString *nickName=weatherDic[@"NickName"];
                                 NSString *photoUrl=weatherDic[@"PhotoUrl"];
                                 NSString *phoneNumber=weatherDic[@"TelPhone"];
                                 [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"HasLogInKey"];
                                 [[NSUserDefaults standardUserDefaults] setObject:nickName forKey:@"NickName"];
                                 //[[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"UserName"];
                                [[NSUserDefaults standardUserDefaults] setObject: photoUrl forKey:@"PhotoUrl"];
                                [self.navigationController setNavigationBarHidden:NO animated:YES];
                                [self.navigationController popViewControllerAnimated:NO];
                            }
                        }
                        else{
                            NSLog(@"Not in main thread--completion handler");
                        }
                    });
    }] resume];
     */
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"HasLogInKey"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController popViewControllerAnimated:NO];

}

-(void)showalert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"登录失败" message:@"用户名或密码错误" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
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
