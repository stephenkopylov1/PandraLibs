//
//  BasicDataSource.h
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicCollectionView.h"
#import "BasicAdapter.h"


@interface BasicDataSource : NSObject
@property (readwrite) BasicAdapter *adapter;
@property (readwrite) BOOL loading;
-(void)registerView:(id)view;
@property (strong,nonatomic) id *data;
@property (nonatomic, weak) id <BasicDataSourceDelegate> delegate;
-(void)setCurrentData:(NSMutableArray *)data;
-(void)refreshData;
-(void)loadMore;
@end
