//
//  PandraLibsVC.m
//  PandraLibs
//
//  Created by Admin on 03.12.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "PandraLibsVC.h"
#import <Masonry.h>
#import "CollectionViewSample.h"

@implementation PandraLibsVC{
    UIButton *lastButton;
    UIView *topLayoutGuide;
}
-(void)viewDidLoad{
    topLayoutGuide = (UIView*)self.topLayoutGuide;
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"collectionView" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(collectionViewSample) forControlEvents:UIControlEventTouchUpInside];
    [self addButton:button1];
}

-(void)addButton:(UIButton*)button{
    [self.view addSubview:button];
    button.layer.borderWidth=1;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        if(lastButton==nil){
            make.top.equalTo(topLayoutGuide.mas_bottom).with.offset(20);
        }else{
            make.top.equalTo(lastButton.mas_bottom).with.offset(20);
        }
    }];
    lastButton = button;
}

-(void)collectionViewSample{
    CollectionViewSample *vc = [[CollectionViewSample alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
