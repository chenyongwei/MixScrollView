//
//  HorizontalScrollCell.h
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MixScrollViewDelegate.h"
#import "MixScrollViewDataSource.h"

@interface HorizontalScrollCell : UITableViewCell

- (id)initWithFrame:(CGRect)frame forIndexPath:(NSIndexPath *)aIndexPath withDataSource:(id <MixScrollViewDataSource>)aDataSource andDelegate:(id <MixScrollViewDelegate>)aDelegate;

@end
