//
//  VerticalScrollCell.m
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "VerticalScrollCell.h"
#import "VerticalScrollCellView.h"

@interface VerticalScrollCell ()

@property (nonatomic, strong) VerticalScrollCellView *verticalScrollCellView;

@end

@implementation VerticalScrollCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup:frame];
    }
    return self;
}

-(void)setup:(CGRect)aFrame
{
    self.contentView.backgroundColor = [UIColor redColor];
    
    NSLog(@"VerticalScrollCell, x= %f, y= %f, w= %f, h= %f", aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aFrame.size.height);
    
    [self.verticalScrollCellView removeFromSuperview];
    self.verticalScrollCellView = [[VerticalScrollCellView alloc] initWithFrame:CGRectMake(aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aFrame.size.height - 100)];
    
    [self.contentView addSubview:self.verticalScrollCellView];
}

@end