//
//  cvDataSourceSample.m
//  PandraLibs
//
//  Created by Admin on 03.12.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "cvDataSourceSample.h"
#import "cvAdapterSample.h"

@implementation cvDataSourceSample
-(BasicAdapter *)getAdapter{
    return [[cvAdapterSample alloc] init];
}
@end
