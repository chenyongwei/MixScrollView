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

// initialized properties
@property (nonatomic) NSIndexPath *indexPath;
@property (nonatomic, weak) id <MixScrollViewDataSource> dataSource;
@property (nonatomic, weak) id <MixScrollViewDelegate> delegate;

@end

@implementation HorizontalScrollCell

- (id)initWithFrame:(CGRect)frame forIndexPath:(NSIndexPath *)aIndexPath withDataSource:(id <MixScrollViewDataSource>)aDataSource andDelegate:(id <MixScrollViewDelegate>)aDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.indexPath = aIndexPath;
        self.dataSource = aDataSource;
        self.delegate = aDelegate;
        
        [self setup:frame];
    }
    return self;
}

-(void)setup:(CGRect)aFrame
{
#if DEBUG
    self.contentView.backgroundColor = [UIColor purpleColor];
#endif
    self.transform = CGAffineTransformMakeRotation(M_PI_2);
    

    
//    NSLog(@"HorizontalScrollCell, x= %f, y= %f, w= %f, h= %f", aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aFrame.size.height);
    
    
}


@end
