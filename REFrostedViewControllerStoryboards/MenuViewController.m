//
//  DEMOMenuViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "MenuViewController.h"
#import "HomeViewController.h"
#import "SecondViewController.h"
#import "UIViewController+REFrostedViewController.h"
#import "NavigationController.h"
#import "CarServiceViewController.h"
#import "userInfoViewController.h"
#import "ListViewController.h"
#import "NotificattionViewController.h"
#import "NotiViewController.h"
@interface MenuViewController ()

@end
@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    UIImageView* userImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
    [userImg setFrame:CGRectMake(20, 30, 80, 80)];
    userImg.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    userImg.image = [UIImage imageNamed:@"Awake"];
    userImg.layer.masksToBounds = YES;
    userImg.layer.cornerRadius = 40.0;
    userImg.layer.borderColor = [UIColor whiteColor].CGColor;
    userImg.layer.borderWidth = 3.0f;
    userImg.layer.rasterizationScale = [UIScreen mainScreen].scale;
    userImg.layer.shouldRasterize = YES;
    userImg.clipsToBounds = YES;
    userImg.userInteractionEnabled = YES;

    
    UIView* headerView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    [headerView addSubview:userImg];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(105, 60, 200, 24)];
    label.text = @"Shang Wang";
    label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    [label sizeToFit];
   // label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [headerView addSubview:label];
  self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];


    self.tableView.tableHeaderView=headerView;
    
}

 

#pragma mark -
#pragma mark UITableView Delegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,tableView.frame.size.width, 20)];
   // view.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1.0f];
    view.backgroundColor = [UIColor colorWithRed:192/255.0f green:192/255.0f blue:192/255.0f alpha:0.4f];
    
    CALayer *upperBorder = [CALayer layer];
    //upperBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f]CGColor];
     upperBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f]CGColor];
    upperBorder.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), 0.4f);
    [view.layer addSublayer:upperBorder];
    CALayer *lowerBorder = [CALayer layer];
    lowerBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f] CGColor];
    lowerBorder.frame = CGRectMake(0, view.frame.size.height, CGRectGetWidth(view.frame),0.4f);
    [view.layer addSublayer:lowerBorder];
    
    /* Create custom view to display section header... */
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        HomeViewController *homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
        navigationController.viewControllers = @[homeViewController];
    }else if(0==indexPath.section  &&1== indexPath.row){
        UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main"
                                                      bundle:nil];
        userInfoViewController* vc = (userInfoViewController*)[sb instantiateViewControllerWithIdentifier:@"userInfoViewController"];
        [navigationController pushViewController:vc animated:NO];
        
    }else if(0==indexPath.section  && 2==indexPath.row){
        ListViewController* list= [[ListViewController alloc] init];
        HomeViewController *homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];
        navigationController.viewControllers = @[homeViewController];
        [navigationController pushViewController:list animated:NO];
        
    }
    else if(0==indexPath.section  && 3==indexPath.row){
        
        NotiViewController *serviceView=[[NotiViewController alloc]initWithNibName:@"NotiViewController" bundle:nil];
        [navigationController pushViewController:serviceView animated:YES];
        
    }
    else {
        // SecondViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"secondController"];
        //navigationController.viewControllers = @[secondViewController];
    }
    self.frostedViewController.contentViewController = navigationController;
    [self.frostedViewController hideMenuViewController];
}


#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
        NSArray *titles = @[@"主页", @"我的账户", @"我的好友",@"消息查看", @"我的订单", @"服务团队",@"停车劵", @"系统设置"];
        cell.textLabel.text = titles[indexPath.row];
  
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
