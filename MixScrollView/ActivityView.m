//
//  ActivityView.m
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "ActivityView.h"

@interface ActivityView () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

// initialized properties
@property (nonatomic) NSInteger activity;
@property (nonatomic, weak) id <MixScrollViewDataSource> dataSource;
@property (nonatomic, weak) id <MixScrollViewDelegate> delegate;

// self created properties
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIView *staticView;

-(void)pageChanged:(id)sender;
-(void)updatePageIndex:(NSInteger)targetPage;

@end

@implementation ActivityView

- (void)dealloc
{
    self.delegate = nil;
    self.dataSource = nil;
}

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
    CGRect staticViewRect = CGRectMake(0,
                                       0,
                                       CGRectGetWidth(self.frame),
                                       staticViewHeight);
    self.staticView = [self.dataSource staticViewAtActivity:self.activity];
    if (self.staticView) {
        self.staticView.frame = staticViewRect;
        [self addSubview:self.staticView];
    }
    
    // Bind Data for Page Control
    self.pageControl.numberOfPages = [self.dataSource numberOfItemsInActivity:self.activity];
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
    return [self.dataSource numberOfItemsInActivity:self.activity];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"cellIdentifier-%@", @"ItemViewCellWeb"];
    
    ItemViewCellBase *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [self.dataSource createItemViewCell:indexPath.row atActivity:self.activity reuseIdentifier:cellIdentifier];
    }
    // transform because the table view transform already
    cell.transform = CGAffineTransformMakeRotation(M_PI_2);

    // set data to custom cell
    cell.data = [self.dataSource dataOfItem:indexPath.row atActivity:self.activity];
    
#if DEBUG
    cell.contentView.backgroundColor = [UIColor purpleColor];
#endif
    
//#if DEBUG
    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, itemTableView.frame.size.width - 20, itemTableView.frame.size.height - 20)];
    //    label.text = [NSString stringWithFormat:@"index : %ld", (long)item];
    //    label.backgroundColor = [UIColor whiteColor];
    //    [cell.contentView addSubview:label];
//#endif
    
    return (UITableViewCell *)cell;
}

@end
