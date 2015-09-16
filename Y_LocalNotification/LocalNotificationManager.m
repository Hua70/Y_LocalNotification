//
//  LocalNotinationManager.m
//  Y_LocalNotification
//
//  Created by YWH on 15/9/10.
//  Copyright (c) 2015年 YWH. All rights reserved.
//

#import "LocalNotificationManager.h"
#import <UIKit/UIKit.h>
static LocalNotificationManager *localNotification = nil;
@implementation LocalNotificationManager


+(LocalNotificationManager *)defaultManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localNotification = [[LocalNotificationManager alloc] init];
    });
    return localNotification;
}


- (void)showNotificationWithAction:(NSString *)action andContent:(NSString *)content
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = content;
    notification.alertAction = action;
    notification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}



- (void)scheduleNotification {
    NSDate *itemDate =  [NSDate date];;
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = [itemDate dateByAddingTimeInterval:5.0];
    localNotif.timeZone = [NSTimeZone systemTimeZone]; // 使用本地时区
    
    localNotif.alertBody = [NSString stringWithFormat:@"YWH，你妈叫你回家吃饭了！"];
    localNotif.alertAction = @"锁屏是的提示";
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
    // 设置重复间隔
    localNotif.repeatInterval = kCFCalendarUnitDay;
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"该吃饭啦～！" forKey:@"提示"];
    localNotif.userInfo = infoDict;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

@end
