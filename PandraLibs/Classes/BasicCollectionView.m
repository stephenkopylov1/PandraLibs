//
//  BasicCollectionView.m
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicCollectionView.h"
#import "BasicDataSource.h"
#import "BasicCollectionViewDataSource.h"
@implementation BasicCollectionView{
    
}
@synthesize basicDataSource;

-(instancetype)initWithDataSource:(BasicDataSource *)dataSource{
    NSLog(@"initWithDataSource = %@",dataSource);
    self.basicDataSource = (BasicCollectionViewDataSource*)dataSource;
    return [super initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:[self getFlowLayout]];
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
