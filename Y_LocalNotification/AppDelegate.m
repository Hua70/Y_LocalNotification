//
//  AppDelegate.m
//  Y_LocalNotification
//
//  Created by YWH on 15/9/10.
//  Copyright (c) 2015年 YWH. All rights reserved.
//

#import "AppDelegate.h"
#import "LocalNotificationManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // ios的本地消息需要用户允许后才可以使用
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        [[UIApplication sharedApplication] registerUserNotificationSettings:[ UIUserNotificationSettings  settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
//   [[LocalNotificationManager defaultManager]showNotificationWithAction:@"YWH" andContent:@"该吃饭啦"];
    [[LocalNotificationManager defaultManager] scheduleNotification];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@"Application did receive local notifications");
    NSDictionary *dic = notification.userInfo;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[dic allKeys] firstObject] message:[[dic allValues] firstObject] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
//    NSLog(@"Application did receive local notifications");
//    
//    // 取消某个特定的本地通知
//    for (UILocalNotification *noti in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
//        NSString *notiID = noti.userInfo[kLocalNotificationID];
//        NSString *receiveNotiID = notification.userInfo[kLocalNotificationID];
//        if ([notiID isEqualToString:receiveNotiID]) {
//            [[UIApplication sharedApplication] cancelLocalNotification:notification];
//            return;
//        }
//    }
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"welcome" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil nil];
//    [alert show];
}

@end
