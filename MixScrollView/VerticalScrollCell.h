//
//  VerticalScrollCell.h
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MixScrollViewDelegate.h"
#import "MixScrollViewDataSource.h"

@interface VerticalScrollCell : UITableViewCell

-(id)initWithFrame:(CGRect)aFrame forActivity:(NSInteger)tActivity withDataSource:(id <MixScrollViewDataSource>)aDataSource andDelegate:(id <MixScrollViewDelegate>)aDelegate;

@end
