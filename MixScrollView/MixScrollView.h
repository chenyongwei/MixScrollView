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

@interface MixScrollView : UIView <UITableViewDelegate, UITableViewDataSource, MixScrollViewDelegate, MixScrollViewDataSource>


@end
