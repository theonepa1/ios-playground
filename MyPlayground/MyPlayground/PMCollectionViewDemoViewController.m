//
//  PMCollectionViewDemoViewController.m
//  MyPlayground
//
//  Created by Pavan Mellamputi on 3/3/19.
//  Copyright © 2019 Pavan Mellamputi. All rights reserved.
//

#import "PMCollectionViewDemoViewController.h"

@interface PMCollectionViewDemoViewController () // <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation PMCollectionViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *const flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.min = 0;
    UICollectionView *const collectionView = [[UICollectionView alloc] initWithLayout:flowLayout];
}

@end
