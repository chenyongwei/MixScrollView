//
//  MixScrollViewDataSource.h
//  MixScrollView
//
//  Created by Yongwei on 4/4/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemViewCellBase.h"

@class MixScrollView;


@protocol MixScrollViewDataSource <NSObject>

@required
- (NSInteger)numberOfItemsInActivity:(NSInteger)activity;
- (UIView *)staticViewAtActivity:(NSInteger)activity;
-(ItemViewCellBase *)createItemViewCell:(NSInteger)item atActivity:(NSInteger)activity reuseIdentifier:(NSString *)cellIdentifier;
-(id)dataOfItem:(NSInteger)item atActivity:(NSInteger)activity;

@optional
- (NSInteger)numberOfActivities;              // Default is 1 if not implemented

@end
