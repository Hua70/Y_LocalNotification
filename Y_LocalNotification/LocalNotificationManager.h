//
//  LocalNotinationManager.h
//  Y_LocalNotification
//
//  Created by YWH on 15/9/10.
//  Copyright (c) 2015年 YWH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalNotificationManager : NSObject
+(LocalNotificationManager *)defaultManager;
- (void)showNotificationWithAction:(NSString *)action andContent:(NSString *)content;
- (void)scheduleNotification;
@end
