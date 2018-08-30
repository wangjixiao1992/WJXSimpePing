//
//  ViewController.m
//  maskView
//
//  Created by wangjixiao on 2018/8/29.
//  Copyright © 2018年 王吉笑. All rights reserved.
//

#import "ViewController.h"
#import "WJXAlertViewCtl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self
               action:@selector(alertViewShow)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)alertViewShow
{
    WJXAlertViewCtl *alert = [WJXAlertViewCtl alertControllerWithTitle:@"title"
                                                               message:@"content。"
                                                        preferredStyle:WJXAlertViewTypeAlert];
    //取消
    WJXAlertAction *cancenAction = [WJXAlertAction actionWithTitle:@"cancel"
                                                         textColor:MAMainColor
                                                             style:WJXAlertActionTypeBold
                                                           handler:^(WJXAlertAction *action) {
                                                               
                                                           }];
    
    [alert addAction:cancenAction];
    [self.navigationController presentViewController:alert
                                            animated:YES
                                          completion:nil];
}





@end
