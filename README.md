  # WJXSimpePing
    
   ## 介绍
    此工程苹果的simpePing的封装

   ## 版本
    1.0.0
    
   ## 版本
    source 'https://github.com/wangjixiao1992/WJXSimpePing.git'
    platform :ios, '8.0'
    
    target 'TargetName' do
    pod 'WJXSimpePing', '~> 1.0.0'
    end

   ## 演示代码
   ```swift
    //AlertView
    [[SimpePingHelper sharedClient] pingTheDomainWithHostName:@"www.apple.com"
    success:^(NSInteger time) {
    NSLog(@"%ld", time);
    } failure:^(NSString *error) {
    NSLog(@"%@", error);
    }];
    
    ```
   ## 联系我们
   如有疑问请发送邮件.谢谢~
   15037535383@163.com


