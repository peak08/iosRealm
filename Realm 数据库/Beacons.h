//
//  Beacons.h
//  Realm 数据库
//
//  Created by apple on 2018/6/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Realm/Realm.h>
#import "dog.h"
//TODO: 新增属性要做数据库迁移   在 appdelegate didFinishLaunchingWithOptions  设置     config.schemaVersion = 2;  比之前数大  

@interface Beacons : RLMObject
@property NSString *uuid;
@property NSString * major;
@property NSString *minor;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,assign) NSInteger age;

@property(nonatomic,assign) NSInteger sex;

//@property(nonatomic,assign) NSInteger weight;

@property(nonatomic,strong) dog *adog;
@end

//RLM_ARRAY_TYPE(Beacons)





