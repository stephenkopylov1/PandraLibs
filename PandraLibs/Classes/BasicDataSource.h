//
//  BasicDataSource.h
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicCollectionView.h"
#import "BasicDataSourceAdapter.h"

@interface BasicDataSource : NSObject
@property (readwrite) BasicDataSourceAdapter *adapter;
-(void)registerCollectionView:(BasicCollectionView*)collectionView;
-(BasicDataSourceAdapter*)getAdapter;
@property (strong,nonatomic) NSMutableArray *data;
@property (nonatomic, weak) id <BasicDataSourceDelegate> delegate;
-(void)setCurrentData:(NSMutableArray *)data;
-(void)refreshData;
-(void)loadMore;
@end
