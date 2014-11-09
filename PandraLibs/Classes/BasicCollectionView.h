//
//  BasicCollectionView.h
//  Piquadro
//
//  Created by Stephen Kopylov on 07/11/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class BasicDataSource;
@interface BasicCollectionView : UICollectionView
-(instancetype) initWithDataSource:(BasicDataSource*)dataSource;
-(UICollectionViewFlowLayout*)getFlowLayout;
@end
