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

// initialized properties
@property (nonatomic) NSInteger activity;
@property (nonatomic, strong) id <MixScrollViewDataSource> dataSource;
@property (nonatomic, strong) id <MixScrollViewDelegate> delegate;

// self created properties
@property (nonatomic, strong) VerticalScrollCellView *verticalScrollCellView;

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
#if DEBUG
    self.contentView.backgroundColor = [UIColor redColor];
#endif
//    NSLog(@"VerticalScrollCell, x= %f, y= %f, w= %f, h= %f", aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aFrame.size.height);
    
    if (!self.verticalScrollCellView) {
        self.verticalScrollCellView = [[VerticalScrollCellView alloc] initWithFrame:CGRectMake(aFrame.origin.x,
                                                                                               aFrame.origin.y,
                                                                                               CGRectGetWidth(aFrame),
                                                                                               CGRectGetHeight(aFrame))
                                                                    forActivity:self.activity
                                                                    withDataSource:self.dataSource
                                                                    andDelegate:self.delegate];
        
        [self.contentView addSubview:self.verticalScrollCellView];
        
    }

}

@end
