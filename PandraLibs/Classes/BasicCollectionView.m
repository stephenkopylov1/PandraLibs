//
//  BasicCollectionView.m
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicCollectionView.h"
#import "BasicDataSource.h"
@implementation BasicCollectionView
-(instancetype)initWithDataSource:(BasicDataSource *)dataSource{
    [dataSource registerCollectionView:self];
    return [super initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:[self getFlowLayout]];
}
-(UICollectionViewFlowLayout *)getFlowLayout{
    UICollectionViewFlowLayout *flowLaout = [[UICollectionViewFlowLayout alloc] init];
    return flowLaout;
}
@end
