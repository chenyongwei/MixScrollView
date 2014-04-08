//
//  VerticalScrollCellView.h
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixScrollViewDelegate.h"

@interface VerticalScrollCellView : UIView <MixScrollViewDelegate>

- (id)initWithFrame:(CGRect)frame pageControlHeight:(CGFloat)aPageControlHeight staticViewHeight:(CGFloat)aStaticViewHeight;
-(void)scrollToPageAtIndex:(NSInteger)index;

@end
