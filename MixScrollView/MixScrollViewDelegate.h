//
//  MixScrollViewDelegate.h
//  MixScrollView
//
//  Created by Yongwei on 4/4/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MixScrollView;

@protocol MixScrollViewDelegate <NSObject>

@optional

- (UIView *)staticViewAtActivity:(NSInteger)activity;

- (CGFloat)heightForStaticViewAtActivity:(NSInteger)activity;
- (CGFloat)heightForPageControlAtActivity:(NSInteger)activity;
- (CGFloat)heightPercentForViewAtActivity:(NSInteger)activity;


@end
