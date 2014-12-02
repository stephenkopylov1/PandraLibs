//
//  BasicDataSource.m
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicDataSource.h"

@implementation BasicDataSource

@synthesize adapter;
@synthesize delegate;

-(void)registerView:(id)view{
    if(adapter==nil){
        adapter = [self getAdapter];
    }
    adapter.basicDataSource = self;
    [adapter registerView:view];
    self.delegate = self.adapter;
}
 
-(BasicAdapter*)getAdapter{
    BasicAdapter *newAdapter = [[BasicAdapter alloc] init];
    return newAdapter;
}

-(void)refreshData{
    
}

-(void)loadMore{
    
}

@end
