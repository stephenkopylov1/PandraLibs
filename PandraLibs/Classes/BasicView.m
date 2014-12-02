//
//  BasicView.m
//  PandraLibs
//
//  Created by Admin on 02.12.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicView.h"

@implementation BasicView

-(instancetype)initWithDataSource:(BasicDataSource *)dataSource{
    self.basicDataSource = (BasicDataSource*)dataSource;
    return [super init];
}

@end
