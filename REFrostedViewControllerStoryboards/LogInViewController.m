//
//  LogInViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Shang Wang on 9/25/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "LogInViewController.h"

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
    NSString *userName=userNameTextField.text;
    NSString *password=passWordTextField.text;
    if(0==userName.length||0==password.length){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"User name or password can not be empty." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"HasLogInKey"];
    [self.navigationController popViewControllerAnimated:NO];
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
