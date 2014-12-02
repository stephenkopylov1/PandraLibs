//
//  BasicDataSourceAdapter.m
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicDataSourceAdapter.h"
#import "BasicDataSource.h"

@implementation BasicDataSourceAdapter
-(void)registerCollectionView:(BasicCollectionView *)collectionView{
    self.collectionView = collectionView;
    if(self.collectionView.refreshEnabled){
        [self.collectionView.refreshControl addTarget:self action:@selector(refreshControlAction:) forControlEvents:UIControlEventValueChanged];
    }
}

- (void)refreshControlAction:(id)sender {
    [self.dataSource refreshData];
}


@end
