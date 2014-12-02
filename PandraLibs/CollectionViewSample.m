//
//  CollectionViewSample.m
//  PandraLibs
//
//  Created by Admin on 03.12.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "CollectionViewSample.h"
#import "BasicCollectionView.h"
#import "cvDataSourceSample.h"

@implementation CollectionViewSample
-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor whiteColor];
    
    BasicCollectionView *basicCollectionView = [[BasicCollectionView alloc] initWithDataSource:[[cvDataSourceSample alloc] init]];
    [self.view addSubview:basicCollectionView];
    
}
@end
