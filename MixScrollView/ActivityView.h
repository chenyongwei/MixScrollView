//
//  ActivityView.h
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MixScrollViewDelegate.h"
#import "MixScrollViewDataSource.h"

@interface ActivityView : UIView

- (id)initWithFrame:(CGRect)frame forActivity:(NSInteger)tActivity withDataSource:(id <MixScrollViewDataSource>)aDataSource andDelegate:(id <MixScrollViewDelegate>)aDelegate;

-(void)scrollToPageAtIndex:(NSInteger)index;

@end
