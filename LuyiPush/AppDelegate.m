//
//  AppDelegate.m
//  LuyiPush
//
//  Created by 卢一 on 14-6-28.
//  Copyright (c) 2014年 卢一. All rights reserved.
//

#import "AppDelegate.h"
#import "PathView.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIViewController alloc] init];
    [self.window makeKeyAndVisible];
    
//    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
//     (UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert |UIRemoteNotificationTypeBadge)];
    
    //register for push notification
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)
    {
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
        UIUserNotificationType types = UIUserNotificationTypeBadge                                                                                                                      | UIUserNotificationTypeSound | UIUserNotificationTypeAlert ;
        
        UIUserNotificationSettings * setting =  [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
        
        
        NSLog(@"isIOS8");
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes: (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
        
        NSLog(@"not isIOS8");
    }
    
    
    
    if (launchOptions != nil)
	{
		NSDictionary* dictionary = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
		if (dictionary != nil)
		{
			NSLog(@"Launched from push notification: %@", dictionary);
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"推送通知"
                                                            message:[launchOptions description]
                                                           delegate:nil
                                                  cancelButtonTitle:@"关闭"
                                                  otherButtonTitles:nil];
            [alert show];
//            [self handlePushInfo:dictionary];
		}
        
	}
    //7e0e802591e8c9f48f62cb1fd581e2ae2380a265 gaodiao's ipad
    NSArray* scheduledNotifications = [NSArray arrayWithArray:application.scheduledLocalNotifications];
    NSLog(@"scheduledNotifications:%@",[scheduledNotifications description]);
    PathView *pv = [[PathView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    [self.window addSubview:pv];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    //47569b12 53cfb960 a1ee1757 06c43080 64d09465 d9d0c92e b18fe4f8 b1634ba1
    NSLog(@"deviceToken: %@", [deviceToken description]);
    
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"Error in registration. Error: %@", error);
    
}
/*
 {
 aps =     {
 alert =         {
 "action-loc-key" = "launch apns";//自定义数据
 "loc-key" = "show text";//推送弹出框的显示内容
 };
 badge = 3;
 sound = default;
 };
 custom1 = value1;
 }
 */
-(void)handlePushInfo:(NSDictionary *)userInfo{
    if (!userInfo) {
        return;
    }
    if ([[userInfo objectForKey:@"aps"] objectForKey:@"alert"]!=NULL) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"推送通知"
                                                        message:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]
                                                       delegate:self
                                              cancelButtonTitle:@" 关闭"
                                              otherButtonTitles:@" 更新状态",nil];
        [alert show];
        
    }
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //6a839d8ef30c9afb55018f20cbfd53bd4a84c9b6e7c3c2fd98f20c6bcebf687f gaodiao's ipad token
    NSLog(@" 收到推送消息 ： %@",userInfo);
    
    //[self handlePushInfo:userInfo];
    //UIApplication.applicationIconBadgeNumber = 0    ;
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
