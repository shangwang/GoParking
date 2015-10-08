//
//  DoubleViewController.h
//  CLTreeViewDemo
//


#import <UIKit/UIKit.h>

@interface DoubleViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView* myTableView;
-(void)changeFrame: (CGRect)frame;
@end

