//
//  PMCollectionViewDemoViewController.m
//  MyPlayground
//
//  Created by Pavan Mellamputi on 3/3/19.
//  Copyright © 2019 Pavan Mellamputi. All rights reserved.
//

#import "PMCollectionViewDemoViewController.h"
#import "PMViewUtils.h"
#import "PMCollectionViewDemoCell.h"

@interface PMCollectionViewDemoViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong, nonnull) NSMutableArray<NSString *> *items;

@end

@implementation PMCollectionViewDemoViewController

- (instancetype)init {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _items = [[NSMutableArray alloc] initWithArray:@[@"Mt. Everest", @"Kilimanjaro"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

    UICollectionViewFlowLayout *const flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    UICollectionView *const collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                                collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = UIColor.whiteColor;
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:collectionView];
    [PMViewUtils pinView:collectionView ToView:self.view];

    [collectionView registerClass:[PMCollectionViewDemoCell class] forCellWithReuseIdentifier:@"PMCollectionViewDemoCell"];
}

#pragma mark - UICollectionViewDataSource

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 50);
}

#pragma mark - UICollectionViewDelegate

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PMCollectionViewDemoCell *const cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PMCollectionViewDemoCell"
                                                                                     forIndexPath:indexPath];
    [cell populateWithText:self.items[indexPath.row]];
    cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? UIColor.lightGrayColor : UIColor.clearColor;
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [self.items count];
}

@end
