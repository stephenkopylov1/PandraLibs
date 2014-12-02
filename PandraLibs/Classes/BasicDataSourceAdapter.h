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
#import "BasicAdapter.h"

@interface BasicDataSourceAdapter : BasicAdapter <UICollectionViewDelegate,UICollectionViewDataSource,BasicDataSourceDelegate>

@property (readwrite) BasicCollectionView *collectionView;
-(void)registerCollectionView:(BasicCollectionView *)collectionView;

@end
