//
//  SimpePingHelper.h
//  cocopods
//
//  Created by wangjixiao on 2018/6/6.
//  Copyright © 2018年 王吉笑. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpePingHelper : NSObject

/**
 *  HTTP 单例
 */
+ (instancetype)sharedClient;


/**
 ping 域名

 @param hostName 域名地址
 @param success 时间差(毫秒)
 @param failure 失败
 */
- (void)pingTheDomainWithHostName:(NSString*)hostName
                        success:(void (^)(NSInteger time))success
                        failure:(void (^)(NSString *error))failure;

@end
