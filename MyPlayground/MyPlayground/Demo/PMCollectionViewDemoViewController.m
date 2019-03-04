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
@property (nonatomic, strong, nonnull) NSMutableArray<NSNumber *> *itemHeights;

@end

@implementation PMCollectionViewDemoViewController

- (instancetype)init {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _items = [[NSMutableArray alloc] initWithArray:@[@"Mt. Everest", @"Kilimanjaro"]];
        _itemHeights = [[NSMutableArray alloc] init];
        [_itemHeights addObject:[NSNumber numberWithFloat:50.0]];
        [_itemHeights addObject:[NSNumber numberWithFloat:50.0]];
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
                  layout:(UICollectionViewLayout * __unused)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.bounds.size.width, self.itemHeights[indexPath.row].floatValue);
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.itemHeights[indexPath.row] = [NSNumber numberWithFloat:100.0];
    [collectionView reloadData];
}

@end
