//
//  ViewController.m
//  maskView
//
//  Created by wangjixiao on 2018/8/29.
//  Copyright © 2018年 王吉笑. All rights reserved.
//

#import "ViewController.h"
#import "SimpePingHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self
               action:@selector(ping)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)ping
{
    [[SimpePingHelper sharedClient] pingTheDomainWithHostName:@"www.apple.com"
                                                      success:^(NSInteger time) {
                                                          NSLog(@"%ld", time);
                                                      } failure:^(NSString *error) {
                                                          NSLog(@"%@", error);
                                                      }];
}





@end
