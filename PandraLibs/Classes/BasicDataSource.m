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
-(void)registerCollectionView:(BasicCollectionView *)collectionView{
    NSLog(@"registerCollectionView");
    if(self.adapter==nil){
        self.adapter = [self getAdapter];
    }
    self.adapter.dataSource = self;
    [self.adapter registerCollectionView:collectionView];
    self.delegate = self.adapter;
    collectionView.delegate = self.adapter;
    collectionView.dataSource = self.adapter;
}
-(BasicDataSourceAdapter*)getAdapter{
    BasicDataSourceAdapter *adapter = [[BasicDataSourceAdapter alloc] init];
    return adapter;
}
-(void)setCurrentData:(NSMutableArray *)data{
    self.data = data;
    if(self.delegate !=nil && [self.delegate respondsToSelector:@selector(dataChanged:)]){
        [self.delegate dataChanged:self.data];
    }
}
@end
