//
//  BasicArrayDataSource.m
//  PandraLibs
//
//  Created by Admin on 02.12.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicArrayDataSource.h"

@implementation BasicArrayDataSource

-(void)setCurrentData:(NSMutableArray *)data{
    self.data = data;
    if(self.delegate !=nil && [self.delegate respondsToSelector:@selector(dataChanged:)]){
        [self.delegate dataChanged:self.data];
    }
}

@end
