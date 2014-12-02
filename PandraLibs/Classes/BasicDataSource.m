//
//  BasicDataSource.m
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicDataSource.h"

@implementation BasicDataSource

-(void)registerView:(id)view{
    if(self.adapter==nil){
        self.adapter = [self getAdapter];
    }
    self.adapter.dataSource = self;
    [self.adapter registerView:view];
    self.delegate = self.adapter;
}
 
-(BasicAdapter*)getAdapter{
    BasicAdapter *adapter = [[BasicAdapter alloc] init];
    return adapter;
}

@end
