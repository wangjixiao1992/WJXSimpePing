//
//  SimpePingHelper.m
//  cocopods
//
//  Created by wangjixiao on 2018/6/6.
//  Copyright © 2018年 王吉笑. All rights reserved.
//

#import "SimpePingHelper.h"
#import "SimplePing.h"


typedef void (^SimpePingHelperPingSuccessCallback)(NSInteger time);
typedef void (^SimpePingHelperPingFailCallback)(NSString *error);


@interface SimpePingHelper ()<SimplePingDelegate>

@property(nonatomic, strong) SimplePing *simplePing;
@property(nonatomic, strong) NSMutableArray *pingItems;
@property(nonatomic, assign) NSInteger beginTime;  // 单个ping 发送时的时间
@property(nonatomic, assign) NSInteger endTime;  // 单个ping 发送时的时间
@property(nonatomic, assign) SimpePingHelperPingSuccessCallback successCallBack;
@property(nonatomic, assign) SimpePingHelperPingFailCallback failCallBack;

@end

@implementation SimpePingHelper

/**
 *  HTTP 单例
 */
+ (instancetype)sharedClient
{
    static SimpePingHelper *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[SimpePingHelper alloc] init];
    });
    return _sharedClient;
}

/**
 ping 域名
 
 @param hostName 域名地址
 @param success 时间差(毫秒)
 @param failure 失败
 */
- (void)pingTheDomainWithHostName:(NSString*)hostName
                          success:(void (^)(NSInteger time))success
                          failure:(void (^)(NSString *error))failure
{
    if (!self.simplePing) {
        self.successCallBack = success;
        self.failCallBack = failure;
        self.simplePing = [[SimplePing alloc] initWithHostName:hostName];
        self.simplePing.delegate = self;
        self.simplePing.addressStyle = SimplePingAddressStyleAny;// 网络类型
        [self.simplePing start];
    }
}

/**
 发送ping数据
 */
- (void)sendPingData
{
    [self.simplePing sendPingWithData:nil];
}


#pragma mark - SimplePingDelegate
- (void)simplePing:(SimplePing *)pinger didStartWithAddress:(NSData *)address
{
    [self sendPingData];
}

- (void)simplePing:(SimplePing *)pinger didFailWithError:(NSError *)error
{
    [self.simplePing stop];
    self.simplePing = nil;
    self.failCallBack(error.description);
}

- (void)simplePing:(SimplePing *)pinger didSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber
{
    NSDate *beginDate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone defaultTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:beginDate];
    NSDate *localeDate = [[NSDate date] dateByAddingTimeInterval:interval];
    self.beginTime = [localeDate timeIntervalSince1970] *1000;
}

- (void)simplePing:(SimplePing *)pinger didFailToSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber error:(NSError *)error
{
    [self.simplePing stop];
    self.simplePing = nil;
    self.failCallBack(error.description);
}


- (void)simplePing:(SimplePing *)pinger didReceivePingResponsePacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber
{
    NSDate *endDate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone defaultTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:endDate];
    NSDate *localeDate = [[NSDate date] dateByAddingTimeInterval:interval];
    self.endTime = [localeDate timeIntervalSince1970] *1000;
    NSInteger time = self.endTime - self.beginTime;
    [self.simplePing stop];
    self.simplePing = nil;
    self.successCallBack(time);
}

- (void)simplePing:(SimplePing *)pinger didReceiveUnexpectedPacket:(NSData *)packet
{
    [self.simplePing stop];
    self.simplePing = nil;
}

@end
