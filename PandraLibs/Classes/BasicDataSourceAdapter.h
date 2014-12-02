//
//  BasicDataSourceAdapter.h
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDataSourceDelegate.h"
#import "BasicCollectionView.h"
#import <UIKit/UIKit.h>

@class BasicDataSource;

@interface BasicDataSourceAdapter : NSObject <UICollectionViewDelegate,UICollectionViewDataSource,BasicDataSourceDelegate>
@property (strong,nonatomic) BasicDataSource *dataSource;
@property (readwrite) BasicCollectionView *collectionView;
-(void)registerCollectionView:(BasicCollectionView *)collectionView;
-(NSInteger)numberOfItemsInSection:(NSInteger)section;
-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
