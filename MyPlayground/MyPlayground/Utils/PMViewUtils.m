//
//  PMViewUtils.m
//  MyPlayground
//
//  Created by Pavan Mellamputi on 3/3/19.
//  Copyright © 2019 Pavan Mellamputi. All rights reserved.
//

#import "PMViewUtils.h"

@implementation PMViewUtils

+ (void)pinView:(UIView *)view ToView:(UIView *)otherView; {
    NSLayoutConstraint *const topConstraint = [view.topAnchor constraintEqualToAnchor:otherView.topAnchor];
    NSLayoutConstraint *const bottomConstraint = [view.bottomAnchor constraintEqualToAnchor:otherView.bottomAnchor];
    NSLayoutConstraint *const leadingConstraint = [view.leadingAnchor constraintEqualToAnchor:otherView.leadingAnchor];
    NSLayoutConstraint *const trailingConstraint = [view.trailingAnchor constraintEqualToAnchor:otherView.trailingAnchor];

    [NSLayoutConstraint activateConstraints:@[topConstraint, bottomConstraint, leadingConstraint, trailingConstraint]];
}

@end
