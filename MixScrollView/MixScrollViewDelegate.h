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

- (CGFloat)mixScrollView:(MixScrollView *)mixScrollView heightForColumnAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)mixScrollView:(MixScrollView *)mixScrollView heightForStaticViewAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)mixScrollView:(MixScrollView *)mixScrollView heightForDynamicViewAtIndexPath:(NSIndexPath *)indexPath;

@end
