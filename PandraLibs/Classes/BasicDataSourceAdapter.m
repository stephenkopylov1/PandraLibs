//
//  BasicDataSourceAdapter.m
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicDataSourceAdapter.h"
#import "BasicDataSource.h"
#import "BasicLoadingCell.h"

@implementation BasicDataSourceAdapter
-(void)registerCollectionView:(BasicCollectionView *)collectionView{
    self.collectionView = collectionView;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView  registerClass:[BasicLoadingCell class] forCellWithReuseIdentifier:@"loadingCell"];
    if(self.collectionView.refreshEnabled){
        [self.collectionView.refreshControl addTarget:self action:@selector(refreshControlAction:) forControlEvents:UIControlEventValueChanged];
    }
}

- (void)refreshControlAction:(id)sender {
    [self.dataSource refreshData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSUInteger numberOfItems = [self numberOfItemsInSection:section];
    if(self.collectionView.loadingMoreEnabled){
        numberOfItems += 1;
    }
    return numberOfItems;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.collectionView.loadingMoreEnabled && indexPath.row == [self collectionView:collectionView numberOfItemsInSection:indexPath.section] - 1) {
        NSLog(@"LOADMORE");
        [self.dataSource loadMore];
        BasicLoadingCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"loadingCell" forIndexPath:indexPath];
        [self prepareLoadingCell:cell withIndexPath:indexPath];
        return cell;
    }else{
        return  [self cellForItemAtIndexPath:indexPath];
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.collectionView.loadingMoreEnabled && indexPath.row == [self collectionView:collectionView numberOfItemsInSection:indexPath.section] - 1) {
        NSLog(@"LOADMORE");
        return CGSizeMake(self.collectionView.frame.size.width, 50);
    }else{
        
        return [self sizeForItemAtIndexPath:indexPath];
    }
}
- (BasicLoadingCell *)prepareLoadingCell:(BasicLoadingCell *)cell withIndexPath:(NSIndexPath *)indexPath {
    [cell.activityIndicator startAnimating];
    return cell;
}

@end
