//
//  ViewController.m
//  Realm 数据库
//
//  Created by apple on 2018/6/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import <Realm.h>
#import "Beacons.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    Beacons *building = [[Beacons alloc]init];
    building.uuid = @"001";
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    building.major = [formatter stringFromDate:[NSDate date]];
    building.name = @"realm";
//    building.age  = 20;
    
//    关系模型
    dog *adog =  [[dog alloc] init];
    adog.name = @"小黑";
    adog.age = 20;
    building.adog = adog;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
//    增加
    [realm transactionWithBlock:^{
        [realm addObject:building];
    }];
    
//    修改  使用kvc
    RLMResults <Beacons *> *res = [Beacons allObjects];
    [realm beginWriteTransaction];
    [[res firstObject] setValue:@"修改name" forKey:@"name"];
    [realm commitWriteTransaction];
//    删除
//    [realm transactionWithBlock:^{
//        [realm deleteAllObjects];
//
////        [realm deleteObject:<#(nonnull RLMObject *)#>];
////        [realm deleteObjects:<#(nonnull id<NSFastEnumeration>)#>];
//    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        查询所有
        RLMResults<Beacons *> *res1 = [Beacons allObjects]; // 从默认的 Realm 数据库中遍历所有 Dog 对象
        
//        条件查询
        RLMResults<Beacons *> *res = [Beacons objectsWhere:@"uuid = '131'"];
        NSLog(@"查询所有%@   条件查询%@",res1,res);
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
