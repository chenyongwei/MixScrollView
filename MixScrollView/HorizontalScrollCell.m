//
//  HorizontalScrollCell.m
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "HorizontalScrollCell.h"
#import "VerticalScrollCellView.h"

@interface HorizontalScrollCell ()

@property (nonatomic, strong) VerticalScrollCellView *verticalScrollCellView;

@end

@implementation HorizontalScrollCell

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
    self.contentView.backgroundColor = [UIColor purpleColor];
    
    self.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    NSLog(@"HorizontalScrollCell, x= %f, y= %f, w= %f, h= %f", aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aFrame.size.height);
    
    
    
}


@end
