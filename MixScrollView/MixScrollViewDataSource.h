//
//  MixScrollViewDataSource.h
//  MixScrollView
//
//  Created by Yongwei on 4/4/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MixScrollView;
@class ItemViewCellBase;

@protocol MixScrollViewDataSource <NSObject>

@required

- (NSInteger)numberOfItemsInActivity:(NSInteger)activity;

- (UIView *)staticViewAtActivity:(NSInteger)activity;
-(ItemViewCellBase *)itemViewCellAtIndexPath:(NSIndexPath *)indexPath;

-(ItemViewCellBase *)itemTableView:(UITableView *)itemTableView itemCellAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSInteger)numberOfActivities;              // Default is 1 if not implemented

@end
