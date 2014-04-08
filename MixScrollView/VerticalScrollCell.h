//
//  VerticalScrollCell.h
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MixScrollViewDelegate.h"

@interface VerticalScrollCell : UITableViewCell <MixScrollViewDelegate>

-(id)initWithFrame:(CGRect)frame innerViewHeightPercent:(CGFloat)heightPercent activity:(NSInteger)activity;

@end
