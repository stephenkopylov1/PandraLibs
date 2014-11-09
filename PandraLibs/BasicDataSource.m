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
    self.adapter = [self getAdapter];
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
@end
