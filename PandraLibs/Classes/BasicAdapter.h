//
//  BasicAdapter.h
//  PandraLibs
//
//  Created by Admin on 02.12.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDataSourceDelegate.h"
#import "BasicAdapterProtocol.h"

@class BasicDataSource;

@interface BasicAdapter : NSObject <BasicDataSourceDelegate, BasicAdapterProtocol>

@end
