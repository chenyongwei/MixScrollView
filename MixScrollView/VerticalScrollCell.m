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
@property (nonatomic) CGFloat innerViewHeightPercent;
@property (nonatomic) NSInteger activity;

@end

@implementation VerticalScrollCell

-(id)initWithFrame:(CGRect)frame innerViewHeightPercent:(CGFloat)tHeightPercent activity:(NSInteger)tActivity
{
    self = [super initWithFrame:frame];
    if (self) {
        self.innerViewHeightPercent = tHeightPercent;
        self.activity = tActivity;
        [self setup:frame];
    }
    return self;
}

-(void)setup:(CGRect)aFrame
{
    self.contentView.backgroundColor = [UIColor redColor];
    
    NSLog(@"VerticalScrollCell, x= %f, y= %f, w= %f, h= %f", aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aFrame.size.height);
    
    CGFloat innerViewHeight = aFrame.size.height * self.innerViewHeightPercent;
    CGFloat pageControlHeight = [self heightForPageControlAtActivity:self.activity];
    CGFloat staticViewHeight = [self heightForStaticViewAtActivity:self.activity];
    
    if (!self.verticalScrollCellView) {
        self.verticalScrollCellView = [[VerticalScrollCellView alloc] initWithFrame:CGRectMake(aFrame.origin.x, aFrame.origin.y + (aFrame.size.height - innerViewHeight) / 2, aFrame.size.width, innerViewHeight) pageControlHeight:pageControlHeight staticViewHeight:staticViewHeight];
        
        [self.contentView addSubview:self.verticalScrollCellView];
        
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.verticalScrollCellView.frame.origin.y + innerViewHeight, 200,10)];
        label.text = [NSString stringWithFormat:@"v-index : %d", arc4random() % 100];
        label.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:label];
    }

}

-(CGFloat)heightForPageControlAtActivity:(NSInteger)activity
{
    return 30.0f;
}

-(CGFloat)heightForStaticViewAtActivity:(NSInteger)activity
{
    return 200.0f;
}

@end
