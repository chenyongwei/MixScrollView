//
//  NSIndexPath+MixScrollView.h
//  MixScrollView
//
//  Created by Yongwei on 8/4/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (MixScrollView)

+ (NSIndexPath *)indexPathForItem:(NSInteger)item inActivity:(NSInteger)Activity;

@property(nonatomic,readonly) NSInteger activity;
@property(nonatomic,readonly) NSInteger item;

@end
