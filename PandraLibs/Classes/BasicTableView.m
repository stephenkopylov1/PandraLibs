//
//  BasicTableView.m
//  PandraLibs
//
//  Created by Admin on 03.12.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicTableView.h"
#import "BasicDataSource.h"
#import "BasicTableViewDataSource.h"


@implementation BasicTableView

@synthesize basicDataSource;

-(instancetype)initWithDataSource:(BasicDataSource *)dataSource{
    self.basicDataSource = (BasicTableViewDataSource*)dataSource;
    return [super init];
}
-(void)didMoveToSuperview{
    if(self.refreshEnabled){
        self.refreshControl = [[UIRefreshControl alloc] init];
        self.refreshControl.tintColor = [UIColor grayColor];
        [self addSubview:self.refreshControl];
    }
    [self.basicDataSource registerView:self];
}
-(UICollectionViewFlowLayout *)getFlowLayout{
    UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc] init];
    return flowLaout;
}

@end
