//
//  BasicDataSource.h
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicAdapter.h"
#import "BasicDataSourceDelegate.h"

@interface BasicDataSource : NSObject


-(void)registerView:(id)view;

-(void)setCurrentData:(NSMutableArray *)data;

-(void)refreshData;

-(void)loadMore;

@property (readwrite) BOOL loading;

@property (strong ,nonatomic) id data;

@property (nonatomic, weak) id <BasicDataSourceDelegate> delegate;

@property (readwrite) BasicAdapter *adapter;


@end
