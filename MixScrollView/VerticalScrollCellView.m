//
//  VerticalScrollCellView.m
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "VerticalScrollCellView.h"
#import "HorizontalScrollCell.h"

@interface VerticalScrollCellView () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

// initialized properties
@property (nonatomic) NSInteger activity;
@property (nonatomic, strong) id <MixScrollViewDataSource> dataSource;
@property (nonatomic, strong) id <MixScrollViewDelegate> delegate;

// self created properties
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIView *staticView;

-(void)pageChanged:(id)sender;
-(void)updatePageIndex:(NSInteger)targetPage;

@end

@implementation VerticalScrollCellView

- (id)initWithFrame:(CGRect)frame forActivity:(NSInteger)tActivity withDataSource:(id <MixScrollViewDataSource>)aDataSource andDelegate:(id <MixScrollViewDelegate>)aDelegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.activity = tActivity;
        self.delegate = aDelegate;
        self.dataSource = aDataSource;
        
        [self setup:frame];
    }
    return self;
}

-(void)setup:(CGRect)aFrame
{

#if DEBUG
    self.backgroundColor = [UIColor greenColor];
#endif
//    NSLog(@"VerticalScrollCellView, x= %f, y= %f, w= %f, h= %f", aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aFrame.size.height);
    
    CGFloat pageControlHeight = [self.delegate heightForPageControlAtActivity:self.activity];
    CGFloat staticViewHeight = [self.delegate heightForStaticViewAtActivity:self.activity];
    // Table View
    CGFloat offset = (CGRectGetWidth(self.frame) - (CGRectGetHeight(self.frame) - pageControlHeight - staticViewHeight)) / 2;
    self.tableView = [[UITableView alloc] initWithFrame:
                      CGRectMake(offset,
                                 -offset + staticViewHeight,
                                 CGRectGetHeight(self.frame) - pageControlHeight - staticViewHeight,
                                 CGRectGetWidth(self.frame))];
    self.tableView.scrollsToTop = NO;
    self.tableView.pagingEnabled = YES;
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
#if DEBUG
    self.tableView.backgroundColor = [UIColor yellowColor];
#endif
    [self addSubview:self.tableView];
    
    // Page Control
    self.pageControl = [[UIPageControl alloc] initWithFrame:
                                CGRectMake(0,
                                           CGRectGetHeight(self.frame) - pageControlHeight,
                                           CGRectGetWidth(self.frame),
                                           pageControlHeight)];
    [self.pageControl setHidesForSinglePage:YES];
    [self.pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor blackColor]];
    [self.pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    self.pageControl.backgroundColor = [UIColor blueColor];
    [self addSubview:self.pageControl];
    
    // Static View
    self.staticView = [[UIView alloc] initWithFrame:
                                CGRectMake(0,
                                           0,
                                           CGRectGetWidth(self.frame),
                                           staticViewHeight)];
#if DEBUG
    self.staticView.backgroundColor = [UIColor grayColor];
#endif
    [self addSubview:self.staticView];
    
    // Bind Data for Page Control
    self.pageControl.numberOfPages = 5;
    self.pageControl.currentPage = 0;

}


#pragma mark - Scrolling & Paging

-(void)scrollToPageAtIndex:(NSInteger)index
{
    [self updatePageIndex:index];
    
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.pageControl.currentPage inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}


-(void)updatePageIndex:(NSInteger)targetPage
{
    self.pageControl.currentPage = targetPage;
}


-(void)pageChanged:(id)sender
{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.pageControl.currentPage inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];

    NSLog(@"page changed to: %ld",(long) self.pageControl.currentPage);
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger targetPage = [[[self.tableView indexPathsForVisibleRows] firstObject] row];
    [self updatePageIndex:targetPage];
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    [self.tableView setContentOffset:CGPointMake(0, CGRectGetWidth(self.tableView.frame)) animated:NO];
//}

#pragma mark - TableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetWidth(tableView.frame);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HorizontalScrollCell *cell = [[HorizontalScrollCell alloc] initWithFrame:tableView.frame];
    
#if DEBUG
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, tableView.frame.size.width - 20, tableView.frame.size.height - 20)];
    label.text = [NSString stringWithFormat:@"index : %ld", (long)indexPath.row];
    label.backgroundColor = [UIColor whiteColor];
    [cell.contentView addSubview:label];
#endif
//    NSLog(@"HorizontalScrollView indexPath row: %ld frame x=%f, y=%f, w=%f, h=%f", (long)indexPath.row, label.frame.origin.x, label.frame.origin.y, label.frame.size.width, label.frame.size.height);
    
    return cell;
}

@end
