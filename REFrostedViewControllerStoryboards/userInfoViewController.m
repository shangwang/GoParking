//
//  userInfoViewController.m
//  GoParking
//
//  Created by Shang Wang on 10/2/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//
#import "userInfoViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "DemoAppDelegate.h"
#import "DemoImageEditor.h"
#import "UIButton+Bootstrap.h"
@interface userInfoViewController ()
@property(nonatomic,strong) DemoImageEditor *imageEditor;
@property(nonatomic,strong) ALAssetsLibrary *library;
@end
@implementation userInfoViewController
@synthesize profileImage;
@synthesize tableView;
@synthesize imgView;
@synthesize headerView;
@synthesize userImg;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    tableView.tableHeaderView=headerView;
  
   // userImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
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
    
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(uploadPhoto:)];
    tapGesture1.numberOfTapsRequired = 1;
    [tapGesture1 setDelegate:self];
    
    [userImg addGestureRecognizer:tapGesture1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) tapGesture: (id)sender
{
    //handle Tap...
}

- (IBAction)uploadPhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentModalViewController:picker animated:YES];
   // [self.navigationController pushViewController:picker animated:YES];
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    self.imageEditor = [[DemoImageEditor alloc] initWithNibName:@"DemoImageEditor" bundle:nil];
    self.imageEditor.checkBounds = YES;
    self.imageEditor.rotateEnabled = YES;
    self.library = library;
    self.imageEditor.doneCallback = ^(UIImage *editedImage, BOOL canceled){
        profileImage=[[UIImage alloc] initWithCGImage:[editedImage CGImage]];
        [self.imgView setImage:profileImage];
        [picker dismissModalViewControllerAnimated:YES];
        [picker setNavigationBarHidden:NO animated:YES];
    };
}


-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image =  [info objectForKey:UIImagePickerControllerOriginalImage];
    NSURL *assetURL = [info objectForKey:UIImagePickerControllerReferenceURL];
    [self.library assetForURL:assetURL resultBlock:^(ALAsset *asset) {
        UIImage *preview = [UIImage imageWithCGImage:[asset aspectRatioThumbnail]];
        self.imageEditor.sourceImage = image;
        self.imageEditor.previewImage = preview;
        [self.imageEditor reset:NO];
        [picker pushViewController:self.imageEditor animated:YES];
        [picker setNavigationBarHidden:YES animated:NO];
    } failureBlock:^(NSError *error) {
        NSLog(@"Failed to get asset from library");
    }];
}



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
        return 20;
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (0==indexPath.section) {
        NSArray *titles = @[@"个人信息", @"消息通知", @"我的好友",@"我的支付方式"];
        cell.textLabel.text = titles[indexPath.row];
    } else if (1==indexPath.section ){
        NSArray *titles = @[@"车辆管理", @"预约/泊车记录", @"我的停车券",@"车友之家"];
        cell.textLabel.text = titles[indexPath.row];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
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



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
