//
//  VerticalScrollCellView.h
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerticalScrollCellView : UIView <UITableViewDelegate, UITableViewDataSource>

-(void)scrollToPageAtIndex:(NSInteger)index;

@end
