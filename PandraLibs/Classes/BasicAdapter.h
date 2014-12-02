//
//  BasicAdapter.h
//  PandraLibs
//
//  Created by Admin on 02.12.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BasicDataSource;

@interface BasicAdapter : NSObject
@property (strong,nonatomic) BasicDataSource *dataSource;
-(void)registerView:(id)view;
@end
