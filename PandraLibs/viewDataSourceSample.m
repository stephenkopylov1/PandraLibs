//
//  viewDataSourceSample.m
//  PandraLibs
//
//  Created by Admin on 03.12.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "viewDataSourceSample.h"
#import "viewAdapterSample.h"


@implementation viewDataSourceSample
-(BasicAdapter *)getAdapter{
    NSLog(@"getAdapter");
    return [[viewAdapterSample alloc] init];
}
-(void)setup{
    User *testUser = [[User alloc] init];
    [self setCurrentData:testUser];
}
@end
