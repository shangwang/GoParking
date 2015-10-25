//
//  ServiceRSVPViewController.m
//  GoParking
//
//  Created by Shang Wang on 10/16/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "ServiceRSVPViewController.h"
#import "CLTree.h"
#import "FXBlurView.h"
#import "ServiceRSVpTitle.h"
#import "ChatViewController.h"
#import "ServiceRSVPDetailCell.h"
#import "CommentCell.h"
#import "SubmitServiceCell.h"
@interface ServiceRSVPViewController ()
@end

@implementation ServiceRSVPViewController
@synthesize tableView;
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
    if (sectionIndex == 0)
        return 0;
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
        
        ServiceRSVpTitle* cell = [[[NSBundle mainBundle] loadNibNamed:@"RSVPTitleCell" owner:self options:nil] lastObject];
        return cell.frame.size.height;
        
    }
    
    if(indexPath.row==0&&1==indexPath.section){
        ServiceRSVPDetailCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ServiceRSVPDetailCell" owner:self options:nil] lastObject];
        return cell.frame.size.height;
        
    }
    if(indexPath.row==0&&2==indexPath.section){
        CommentCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:self options:nil] lastObject];
        cell.parentServiceRSVPCtr=self;
        return cell.frame.size.height;
    }
    
    if(indexPath.row==0&&3==indexPath.section){
        SubmitServiceCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"SubmitServiceCell" owner:self options:nil] lastObject];
        return cell.frame.size.height;
    }
    
    return 250;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0&&0==indexPath.section){
        ServiceRSVpTitle* cell = [[[NSBundle mainBundle] loadNibNamed:@"ServiceRSVpTitle" owner:self options:nil] lastObject];
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        return cell;
        return cell;
    }else if (0==indexPath.row&&1==indexPath.section){
        ServiceRSVPDetailCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"ServiceRSVPDetailCell" owner:self options:nil] lastObject];
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        return cell;
    }
    else if (0==indexPath.row&&2==indexPath.section){
        CommentCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentCell" owner:self options:nil] lastObject];
        cell.parentServiceRSVPCtr=self;
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        return cell;
    }
    else if (0==indexPath.row&&3==indexPath.section){
        SubmitServiceCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"SubmitServiceCell" owner:self options:nil] lastObject];
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
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


-(void)textViewDidBeginEditing:(UITextView *)textView{
   
    UITableViewCell *cell;
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        // Load resources for iOS 6.1 or earlier
        cell = (UITableViewCell *) textView.superview.superview;
        
    } else {
        // Load resources for iOS 7 or later
        cell = (UITableViewCell *) textView.superview.superview.superview;
        // TextField -> UITableVieCellContentView -> (in iOS 7!)ScrollView -> Cell!
    }
    [tableView scrollToRowAtIndexPath:[tableView indexPathForCell:cell] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
}

@end

