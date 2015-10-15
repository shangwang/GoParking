//
//  TestViewController1.m
//  Example
//
//  Created by Nicolas Goles on 6/7/14.
//  Copyright (c) 2014 Goles. All rights reserved.
//

#import "TestViewController1.h"

@interface TestViewController1 ()

@end

@implementation TestViewController1

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"待处理"
                                                        image:[UIImage imageNamed:@"user_normal"]
                                                selectedImage:[UIImage imageNamed:@"user_pressed"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
