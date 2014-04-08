//
//  VerticalScrollCell.m
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "VerticalScrollCell.h"
#import "VerticalScrollCellView.h"
#import "MixScrollView.h"

@interface VerticalScrollCell ()

@property (nonatomic, strong) VerticalScrollCellView *verticalScrollCellView;
@property (nonatomic) NSInteger activity;
@property (nonatomic, strong) id <MixScrollViewDataSource> dataSource;
@property (nonatomic, strong) id <MixScrollViewDelegate> delegate;

@end

@implementation VerticalScrollCell

-(void)dealloc
{
    self.delegate = nil;
    self.dataSource = nil;
}

-(id)initWithFrame:(CGRect)aFrame forActivity:(NSInteger)tActivity withDataSource:(id <MixScrollViewDataSource>)aDataSource andDelegate:(id <MixScrollViewDelegate>)aDelegate
{
    self = [super initWithFrame:aFrame];
    if (self) {
        self.activity = tActivity;
        self.dataSource = aDataSource;
        self.delegate = aDelegate;
        
        [self setup:aFrame];
    }
    return self;
}

-(void)setup:(CGRect)aFrame
{
    self.contentView.backgroundColor = [UIColor redColor];
    
    NSLog(@"VerticalScrollCell, x= %f, y= %f, w= %f, h= %f", aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aFrame.size.height);
    
    CGFloat innerViewHeight = aFrame.size.height * 1;
    CGFloat pageControlHeight = [self.delegate heightForPageControlAtActivity:self.activity];
    CGFloat staticViewHeight = [self.delegate heightForStaticViewAtActivity:self.activity];
    
    if (!self.verticalScrollCellView) {
        self.verticalScrollCellView = [[VerticalScrollCellView alloc] initWithFrame:CGRectMake(aFrame.origin.x, aFrame.origin.y + (aFrame.size.height - innerViewHeight) / 2, aFrame.size.width, innerViewHeight) pageControlHeight:pageControlHeight staticViewHeight:staticViewHeight];
        
        [self.contentView addSubview:self.verticalScrollCellView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.verticalScrollCellView.frame.origin.y + innerViewHeight, 200,10)];
        label.text = [NSString stringWithFormat:@"v-index : %d", arc4random() % 100];
        label.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:label];
    }

}

@end
