
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
#import "MyAnimatedAnnotationView.h"
#import "UIButton+Bootstrap.h"
#import "ServiceViewController.h"
#import "ServiceViewController.h"
#import "CLTree.h"
#import "Record_Cell.h"
#import "QRCodeReaderViewController.h"
#import "QRCodeReader.h"

@interface HomeViewController ()
@property(strong,nonatomic) NSMutableArray* dataArray; //保存全部数据的数组
@property(strong,nonatomic) NSArray *displayArray;   //保存要显示在界面上的数据的数组
@end
@implementation HomeViewController
@synthesize mainView;
@synthesize userName;
@synthesize userNickName;
@synthesize m_JsonData;
@synthesize fingParkingButton;
@synthesize serviceButton;
@synthesize menuIcon;
@synthesize serviceListArray;
@synthesize serviceItemArray;
@synthesize dataCount;
@synthesize notificationTableView;
@synthesize scanButton;
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
- (IBAction)startService:(id)sender {
    
    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main"
                                                  bundle:nil];
    ServiceViewController* vc = (ServiceViewController*)[sb instantiateViewControllerWithIdentifier:@"ServiceViewController"];
    //[se.f,navigationController pushViewController:vc animated:NO];
    [self.navigationController pushViewController:vc animated:YES];
     
}

-(void)viewDidLoad{
    [super viewDidLoad];
    dataCount=3;
    mainView.backgroundColor=[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg_blur.png"]];
    serviceListArray = @[@"充值礼券", @"发送礼券", @"洗车服务", @"代驾服务", @"代泊服务", @"人工服务",@"休闲娱乐"];
    [menuIcon setFrame:CGRectMake(menuIcon.frame.origin.x, menuIcon.frame.origin.y, menuIcon.frame.size.height, menuIcon.frame.size.height)];\
    //[fingParkingButton infoStyle];
    //[serviceButton successStyle];
    self.frostedViewController.panGestureEnabled=NO;
    //mainView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BGMain"]];
    //check login
    BOOL hasLoginKey = [[NSUserDefaults standardUserDefaults] boolForKey:@"HasLogInKey"];
    if(!hasLoginKey){
        //if(YES){
        LogInViewController *payView=[[LogInViewController alloc]initWithNibName:@"LogInViewController" bundle:nil];
        [self.navigationController pushViewController:payView animated:NO];
    }else{//get the saved login information
        
    }
    
    
    notificationTableView.dataSource = self;
    notificationTableView.delegate = self;
    notificationTableView.backgroundColor = [UIColor clearColor];
    notificationTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //notificationTableView.allowsMultipleSelectionDuringEditing = NO;
    notificationTableView.scrollEnabled = NO;
    notificationTableView.allowsSelection = NO;
    [self addTestData];//添加演示数据
    [self reloadDataForDisplayArray];//初始化将要显示的数据

    
}
- (IBAction)scanQR:(id)sender {
    if ([QRCodeReader supportsMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]]) {
        static QRCodeReaderViewController *reader = nil;
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            reader                        = [QRCodeReaderViewController new];
            reader.modalPresentationStyle = UIModalPresentationFormSheet;
        });
        reader.delegate = self;
        
        [reader setCompletionWithBlock:^(NSString *resultAsString) {
            NSLog(@"Completion with result: %@", resultAsString);
        }];
        
        [self presentViewController:reader animated:YES completion:NULL];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Reader not supported by the current device" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }

}


-(void)viewWillAppear:(BOOL)animated{
   //[self.navigationController setNavigationBarHidden:YES animated:NO];
    
    menuIcon.alpha=0.6;
    scanButton.alpha=0.8;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                        forBarMetrics:UIBarMetricsDefault];
}

-(void)connectToLogIn: (NSString*) userName paswd: (NSString*)passWord{
    
}


- (IBAction)clickOnPayButton:(id)sender {
    
    PayViewController *payView=[[PayViewController alloc]initWithNibName:@"PayViewController" bundle:nil];
    [self.navigationController pushViewController:payView animated:YES];
    
}


-(void)popMenuViewSelectIndex:(NSInteger)index{
    
    ServiceViewController *serviceView=[[ServiceViewController alloc]initWithNibName:@"ServiceViewController" bundle:nil];
    JKPopMenuItem *item=[serviceItemArray objectAtIndex:index];
    serviceView.serviceLable.text=item.title;
    [serviceView setserviceLable:item.title];
    [self.navigationController pushViewController:serviceView animated:NO];
    [serviceView setserviceLable:item.title];
   
}



#pragma mark - QRCodeReader Delegate Methods

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"QRCodeReader" message:result delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


//添加演示数据
-(void) addTestData{
    CLTreeViewNode *node3 = [[CLTreeViewNode alloc]init];
    node3.nodeLevel = 0;//根层cell
    node3.type = 3;//type 1的cell
    node3.sonNodes = nil;
    node3.isExpanded = FALSE;//关闭状态
    CLTreeView_LEVEL3_Model *tmp3 =[[CLTreeView_LEVEL3_Model alloc]init];
    node3.nodeData = tmp3;
    
    CLTreeViewNode *node4 = [[CLTreeViewNode alloc]init];
    node4.nodeLevel = 0;
    node4.type = 3;
    node4.sonNodes = nil;
    node4.isExpanded = FALSE;
    CLTreeView_LEVEL3_Model *tmp4 =[[CLTreeView_LEVEL3_Model alloc]init];
    node4.nodeData = tmp4;
    
    CLTreeViewNode *node5 = [[CLTreeViewNode alloc]init];
    node5.nodeLevel = 1;//第一层节点
    node5.type = 3;//type 2的cell
    node5.sonNodes = nil;
    node5.isExpanded = FALSE;
    CLTreeView_LEVEL3_Model *tmp5 =[[CLTreeView_LEVEL3_Model alloc]init];
    node5.nodeData = tmp5;
    

    _dataArray = [NSMutableArray arrayWithObjects:node3,node4,node5, nil];//插入到元数据数组
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return dataCount;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return NO;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(0==indexPath.row){
    static NSString *indentifier3 = @"CLTreeView_LEVEL3_Cell";
    CLTreeViewNode *node = [_displayArray objectAtIndex:indexPath.row];
    
    CLTreeView_LEVEL3_Cell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier3];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CLTreeView_LEVEL3_Cell" owner:self options:nil] lastObject];
        }
        cell.node = node;
        [self loadDataForTreeViewCell:cell with:node];
        [cell setNeedsDisplay];
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        cell.parentTableView=notificationTableView;
        cell.parentHomeView=self;

        return cell;
    
    }
    else{
        
        Record_Cell* cell= [tableView dequeueReusableCellWithIdentifier:@"Record_Cell"];
        if(cell == nil){
            cell = [[[NSBundle mainBundle] loadNibNamed:@"Record_Cell" owner:self options:nil] lastObject];
        }
        cell.backgroundColor=[[UIColor grayColor]colorWithAlphaComponent:0.1];
        cell.parentTableView=notificationTableView;
        cell.parentHomeView=self;
        return cell;
    }

    
}




/*---------------------------------------
 为不同类型cell填充数据
 --------------------------------------- */
-(void) loadDataForTreeViewCell:(UITableViewCell*)cell with:(CLTreeViewNode*)node{

        CLTreeView_LEVEL3_Model *nodeData = node.nodeData;
        ((CLTreeView_LEVEL3_Cell*)cell).name.text = nodeData.name;
    
}

/*---------------------------------------
 cell高度默认为50
 --------------------------------------- */
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
     if(0==indexPath.row){
    return 63;
     }else{
         return 63;
     }
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
    
    dataCount--;
    [notificationTableView endUpdates];
}


/*---------------------------------------
 旋转箭头图标
 --------------------------------------- */
-(void) rotateArrow:(CLTreeView_LEVEL0_Cell*) cell with:(double)degree{
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        cell.arrowView.layer.transform = CATransform3DMakeRotation(degree, 0, 0, 1);
    } completion:NULL];
}

/*---------------------------------------
 初始化将要显示的cell的数据
 --------------------------------------- */
-(void) reloadDataForDisplayArray{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    for (CLTreeViewNode *node in _dataArray) {
        [tmp addObject:node];
        if(node.isExpanded){
            for(CLTreeViewNode *node2 in node.sonNodes){
                [tmp addObject:node2];
                if(node2.isExpanded){
                    for(CLTreeViewNode *node3 in node2.sonNodes){
                        [tmp addObject:node3];
                    }
                }
            }
        }
    }
    _displayArray = [NSArray arrayWithArray:tmp];
    [self.notificationTableView reloadData];
}

/*---------------------------------------
 修改cell的状态(关闭或打开)
 --------------------------------------- */
-(void) reloadDataForDisplayArrayChangeAt:(NSInteger)row{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    NSInteger cnt=0;
    for (CLTreeViewNode *node in _dataArray) {
        [tmp addObject:node];
        if(cnt == row){
            node.isExpanded = !node.isExpanded;
        }
        ++cnt;
        if(node.isExpanded){
            for(CLTreeViewNode *node2 in node.sonNodes){
                [tmp addObject:node2];
                if(cnt == row){
                    node2.isExpanded = !node2.isExpanded;
                }
                ++cnt;
                if(node2.isExpanded){
                    for(CLTreeViewNode *node3 in node2.sonNodes){
                        [tmp addObject:node3];
                        ++cnt;
                    }
                }
            }
        }
    }
    _displayArray = [NSArray arrayWithArray:tmp];
    [self.notificationTableView reloadData];
}


@end