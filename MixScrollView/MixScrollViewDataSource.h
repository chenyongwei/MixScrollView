//
//  MixScrollViewDataSource.h
//  MixScrollView
//
//  Created by Yongwei on 4/4/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MixScrollView;

@protocol MixScrollViewDataSource <NSObject>

@required

- (NSInteger)mixScrollView:(MixScrollView *)mixScrollView numberOfItemsInActivity:(NSInteger)activity;

- (UIView *)mixScrollView:(MixScrollView *)mixScrollView viewForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSInteger)numberOfActivitiesInMixScrollView:(MixScrollView *)mixScrollView;              // Default is 1 if not implemented

@end
