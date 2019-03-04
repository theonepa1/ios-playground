//
//  PMCollectionViewDemoCell.m
//  MyPlayground
//
//  Created by Pavan Mellamputi on 3/3/19.
//  Copyright © 2019 Pavan Mellamputi. All rights reserved.
//

#import "PMCollectionViewDemoCell.h"

@interface PMCollectionViewDemoCell ()

@property (nonatomic, strong, nonnull) UILabel *label;

@end

@implementation PMCollectionViewDemoCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_label];
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *const bottomConstraint = [self.bottomAnchor constraintEqualToAnchor:_label.bottomAnchor];
        NSLayoutConstraint *const trailingConstraint = [self.trailingAnchor constraintEqualToAnchor:_label.trailingAnchor];
        [NSLayoutConstraint activateConstraints:@[bottomConstraint, trailingConstraint]];
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)populateWithText:(NSString *)text {
    self.label.text = text;
    [self.label sizeToFit];
}

@end
