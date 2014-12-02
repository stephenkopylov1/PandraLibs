//
//  BasicDataSource.m
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicDataSource.h"
#import "BasicDataSourceDelegate.h"

@implementation BasicDataSource
-(void)registerView:(id)view;
    NSLog(@"registerCollectionView");
    if(self.adapter==nil){
        self.adapter = [self getAdapter];
    }
    self.adapter.dataSource = self;
    [self.adapter registerCollectionView:collectionView];
    self.delegate = self.adapter;
}
-(BasicDataSourceAdapter*)getAdapter{
    BasicDataSourceAdapter *adapter = [[BasicDataSourceAdapter alloc] init];
    return adapter;
}

-(void)refreshData{
    
}

-(void)loadMore{
    
}

-(void)setCurrentData:(NSMutableArray *)data{
    NSLog(@"setCurrentData = %@",data);
    self.data = data;
    if(self.delegate !=nil && [self.delegate respondsToSelector:@selector(dataChanged:)]){
        NSLog(@"allok = %@",data);
        [self.delegate dataChanged:self.data];
    }
}
@end
