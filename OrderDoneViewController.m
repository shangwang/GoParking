//
//  OrderDoneViewController.m
//  GoParking
//
//  Created by Shang Wang on 10/14/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "OrderDoneViewController.h"
#import "ToDoCell.h"
@interface OrderDoneViewController ()

@end

@implementation OrderDoneViewController
@synthesize tableView;
//@synthesize view;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor=[UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1.0f];
    tableView =[[UITableView alloc] initWithFrame:self.view.frame];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    
    tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.allowsSelection=NO;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row==0&&0==indexPath.section){
        
        ToDoCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ToDoCell" owner:self options:nil] lastObject];
        return cell.frame.size.height;
        
    }
    
    if(indexPath.row==0&&1==indexPath.section){
        ToDoCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ToDoCell" owner:self options:nil] lastObject];
        return cell.frame.size.height;
        
    }
    if(indexPath.row==0&&2==indexPath.section){
        ToDoCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ToDoCell" owner:self options:nil] lastObject];
        return cell.frame.size.height;
    }
    
    if(indexPath.row==0&&3==indexPath.section){
        ToDoCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ToDoCell" owner:self options:nil] lastObject];
        return cell.frame.size.height;
    }
    
    return 45;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0&&0==indexPath.section){
        ToDoCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ToDoCell" owner:self options:nil] lastObject];
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        cell.TypeLabel.textColor=[UIColor whiteColor];
        cell.TypeLabel.backgroundColor=[UIColor blueColor];
        cell.profileImg.image = [UIImage imageNamed:@"Head5"];
        [cell.reviewBtn setHidden:NO];
        cell.statusLabel.text=@"已完成";
        cell.statusLabel.textColor=[UIColor grayColor];
        return cell;
    }else if (0==indexPath.row&&1==indexPath.section){
        ToDoCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ToDoCell" owner:self options:nil] lastObject];
        cell.TypeLabel.text=@"预约洗车";
        cell.profileImg.image = [UIImage imageNamed:@"Head4"];
        cell.TypeLabel.textColor=[UIColor whiteColor];
        cell.TypeLabel.backgroundColor=[UIColor purpleColor];
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        [cell.reviewBtn setHidden:NO];
        cell.statusLabel.text=@"已完成";
        cell.statusLabel.textColor=[UIColor grayColor];
        return cell;
    }
    else if (0==indexPath.row&&2==indexPath.section){
        ToDoCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ToDoCell" owner:self options:nil] lastObject];
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        cell.profileImg.image = [UIImage imageNamed:@"Head2"];
        [cell.reviewBtn setHidden:NO];
        cell.statusLabel.text=@"已完成";
        cell.statusLabel.textColor=[UIColor grayColor];
        return cell;
    }
    else if (0==indexPath.row&&3==indexPath.section){
        ToDoCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ToDoCell" owner:self options:nil] lastObject];
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        cell.profileImg.image = [UIImage imageNamed:@"Head4"];
        [cell.reviewBtn setHidden:NO];
        cell.statusLabel.text=@"已完成";
        cell.statusLabel.textColor=[UIColor grayColor];
        return cell;
    }
    else{
        static NSString *cellIdentifier = @"Cell";
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
    view.backgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1.0f];
    CALayer *upperBorder = [CALayer layer];
    upperBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f]CGColor];
    upperBorder.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), 0.4f);
    [view.layer addSublayer:upperBorder];
    CALayer *lowerBorder = [CALayer layer];
    lowerBorder.backgroundColor = [[UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:0.8f] CGColor];
    lowerBorder.frame = CGRectMake(0, view.frame.size.height, CGRectGetWidth(view.frame),0.4f);
    [view.layer addSublayer:lowerBorder];
    /* Create custom view to display section header... */
    return view;
}


@end