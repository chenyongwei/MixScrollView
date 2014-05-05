//
//  MixScrollView.h
//  MixScrollView
//
//  Created by Yongwei on 4/4/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MixScrollViewDataSource.h"
#import "MixScrollViewDelegate.h"

@interface MixScrollView : UIView

@property (nonatomic, strong) id <MixScrollViewDelegate> delegate;
@property (nonatomic, strong) id <MixScrollViewDataSource> dataSource;

@end
