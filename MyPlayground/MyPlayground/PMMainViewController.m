//
//  PMMainViewController.m
//  MyPlayground
//
//  Created by Pavan Mellamputi on 3/3/19.
//  Copyright © 2019 Pavan Mellamputi. All rights reserved.
//

#import "PMMainViewController.h"
#import "PMMainViewCell.h"
#import "PMCollectionViewDemoViewController.h"

@interface PMMainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong, nonnull) NSArray<NSString *> *options;

@end

@implementation PMMainViewController

- (instancetype)init {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _options = @[@"Collection view"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.greenColor;

    UITableView *const tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;

    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *const topConstraint = [tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor];
    NSLayoutConstraint *const leadingConstraint = [tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor];
    NSLayoutConstraint *const widthConstraint = [tableView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor];
    NSLayoutConstraint *const heightConstraint = [tableView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor];
    [NSLayoutConstraint activateConstraints:@[topConstraint, leadingConstraint, widthConstraint, heightConstraint]];

    [tableView registerClass:[PMMainViewCell class] forCellReuseIdentifier:@"PMMainViewCell"];
}

#pragma mark - UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *const cell = [tableView dequeueReusableCellWithIdentifier:@"PMMainViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.options[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView * __unused)tableView numberOfRowsInSection:(__unused NSInteger)section {
    return [self.options count];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView * __unused)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self didSelectOptionAtIndex:indexPath.row];
}

#pragma mark - Private methods

- (void)didSelectOptionAtIndex:(NSUInteger)index {
    switch (index) {
        case 0: {
            PMCollectionViewDemoViewController *const collectionViewDemoVC = [[PMCollectionViewDemoViewController alloc] init];
            [self.navigationController pushViewController:collectionViewDemoVC animated:YES];
            break;
        }
    }
}

@end
