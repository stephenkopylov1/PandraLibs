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
    NSLog(@"setCurrentData = %@",data);
    self.data = data;
    if(self.delegate !=nil && [self.delegate respondsToSelector:@selector(dataChanged:)]){
        NSLog(@"allok = %@",data);
        [self.delegate dataChanged:self.data];
    }
    
}

@end
