//
//  dog.h
//  Realm 数据库
//
//  Created by apple on 2018/6/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Realm/Realm.h>

@interface dog : RLMObject

@property(nonatomic,copy) NSString *name;

@property(nonatomic,assign) NSInteger age;

@property(nonatomic,assign) NSInteger sex;



@end
