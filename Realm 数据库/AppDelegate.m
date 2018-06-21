//
//  AppDelegate.m
//  Realm 数据库
//
//  Created by apple on 2018/6/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import <Realm.h>
#import "Beacons.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 此段代码位于 [AppDelegate didFinishLaunchingWithOptions:]
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    // 设置新的架构版本。必须大于之前所使用的版本
    // （如果之前从未设置过架构版本，那么当前的架构版本为 0）
    config.schemaVersion = 6;
    
    // 设置模块，如果 Realm 的架构版本低于上面所定义的版本，
    // 那么这段代码就会自动调用
    config.migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion) {
        // 我们目前还未执行过迁移，因此 oldSchemaVersion == 0
        if (oldSchemaVersion < 4) {
            // 没有什么要做的！
            // Realm 会自行检测新增和被移除的属性
            // 然后会自动更新磁盘上的架构
            
            //TODO: 修改之前老数据  重置等
            [migration enumerateObjects:Beacons.className
                                  block:^(RLMObject *oldObject, RLMObject *newObject) {
                                      
                                      // 将两个 name 合并到 fullName 当中
                                      newObject[@"name"] = [NSString stringWithFormat:@"%@ %@",
                                                                oldObject[@"age"],
                                                                oldObject[@"sex"]];
                                  }];

        }
    };
    
    // 通知 Realm 为默认的 Realm 数据库使用这个新的配置对象
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
    // 现在我们已经通知了 Realm 如何处理架构变化，
    // 打开文件将会自动执行迁移
    [RLMRealm defaultRealm];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
