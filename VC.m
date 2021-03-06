//
//  VC.m
//  WKAlertViewDemo
//
//  Created by 王琨 on 15-3-11.
//  Copyright (c) 2015年 王琨. All rights reserved.
//

#import "VC.h"
#import "WKAlertView.h"

@interface VC ()
{
    UIWindow *__sheetWindow ;//window必须为全局变量或成员变量

}
@end

@implementation VC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    CGFloat x = self.view.center.x ;
    CGFloat y = self.view.center.y - 200;
    
    NSArray * textArray = @[@"成功",@"失败",@"警告"];
    
    for (NSUInteger i = 0; i < 3 ; i ++) {
        UIButton * successButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [successButton setTitle:textArray[i] forState:UIControlStateNormal];
        successButton.center  = CGPointMake(x, y);
        successButton.bounds = CGRectMake(0, 0, 100, 30);
        [self.view addSubview:successButton];
        [successButton addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
        successButton.tag = 60 + i;
        y += 60;
    }
    


}

- (void)show:(UIButton *)sender
{
    
    NSString * title = nil;
    NSString * detail = nil;
    NSString * cancle = @"取消";
    NSString * ok = @"确定";
    switch (sender.tag - 59) {
        case WKAlertViewStyleSuccess:
        case WKAlertViewStyleDefalut:
            title = @"温馨提示";
            detail = @"登录成功";
            cancle = nil;
            break;
        case WKAlertViewStyleFail:
            title = @"错误提示";
            detail = @"您输入的号码有误。";
            break;
        case WKAlertViewStyleWaring:
            title = @"警告";
            detail = @"您正在进行非安全操作！！";
        default:
            break;
    }
    //为成员变量Window赋值则立即显示Window
    __sheetWindow = [WKAlertView showAlertViewWithStyle:sender.tag - 59 title:title detail:detail canleButtonTitle:cancle okButtonTitle:ok callBlock:^(MyWindowClick buttonIndex) {
        
        //Window隐藏，并置为nil，释放内存 不能少
        __sheetWindow.hidden = YES;
        __sheetWindow = nil;

    }];
}



@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com