//
//  NotificattionViewController.m
//  GoParking
//
//  Created by Shang Wang on 10/6/15.
//  Copyright © 2015 Shang Wang. All rights reserved.
//

#import "NotificattionViewController.h"
#import "NotificationTableViewCell.h"
@interface NotificattionViewController ()
@property(strong,nonatomic) NSMutableArray* dataArray; //保存全部数据的数组
@property(strong,nonatomic) NSArray *displayArray;   //保存要显示在界面上的数据的数组
@property int dataCount;
@end

@implementation NotificattionViewController
@synthesize notificationTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
   self.dataCount=5;
    
    UIImage *img=[UIImage imageNamed:@"bg_blur"];
    img= [self imageWithImage:img scaledToSize:(self.view.frame.size)];
    self.view.backgroundColor=[[UIColor alloc] initWithPatternImage:img];

    /*
    // Do any additional setup after loading the view from its nib.
    notificationTableView.dataSource = self;
    notificationTableView.delegate = self;
    notificationTableView.backgroundColor = [UIColor clearColor];
    notificationTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //notificationTableView.allowsMultipleSelectionDuringEditing = NO;
    //notificationTableView.scrollEnabled = NO;
    notificationTableView.allowsSelection = NO;
    notificationTableView.allowsMultipleSelectionDuringEditing = NO;
    //[notificationTableView setFrame:self.view.frame];
    [notificationTableView setFrame: CGRectMake(200, 500, 300, 300)];
    [self addTestData];//添加演示数据
     */
}

-(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//添加演示数据
-(void) addTestData{
    
}



-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataCount;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        
        NSArray *insertIndexPaths = [[NSArray alloc] initWithObjects:
                                     indexPath, nil];
        
        [notificationTableView beginUpdates];
        [notificationTableView deleteRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
        
        self.dataCount--;
        [notificationTableView endUpdates];
    }
}






-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
       NotificationTableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:@"NotificationTableViewCell"];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"NotificationTableViewCell" owner:self options:nil] lastObject];
        }
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
    //[cell setFrame:self.view.frame];
        return cell;
}



/*---------------------------------------
 cell高度默认为50
 --------------------------------------- */
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 140;
}

/*---------------------------------------
 处理cell选中事件，需要自定义的部分
 --------------------------------------- */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[self deleteCell:indexPath];
}

-(void)deleteCell: (NSIndexPath *)indexPath{
    
    NSArray *insertIndexPaths = [[NSArray alloc] initWithObjects:
                                 indexPath, nil];
    
    [notificationTableView beginUpdates];
    [notificationTableView deleteRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    
    self.dataCount--;
    [notificationTableView endUpdates];
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
