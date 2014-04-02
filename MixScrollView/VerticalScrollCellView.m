//
//  VerticalScrollCellView.m
//  MixScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "VerticalScrollCellView.h"
#import "HorizontalScrollCell.h"

@interface VerticalScrollCellView ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIPageControl *pageControl;

-(void)pageChanged:(id)sender;
-(void)updatePageIndex:(NSInteger)targetPage;

@end

@implementation VerticalScrollCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup:frame];
    }
    return self;
}

-(void)setup:(CGRect)aFrame
{
    self.backgroundColor = [UIColor greenColor];
    
    NSLog(@"HorizontalScrollView, x= %f, y= %f, w= %f, h= %f", aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aFrame.size.height);
    
    int pageControlHeight = 50;
    // Table View
    CGFloat offset = (CGRectGetWidth(self.frame) - (CGRectGetHeight(self.frame) - pageControlHeight)) / 2;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(offset, -offset, CGRectGetHeight(self.frame) - pageControlHeight, CGRectGetWidth(self.frame))];
    self.tableView.scrollsToTop = NO;
    self.tableView.pagingEnabled = YES;
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.tableView];
    
    // Page Control
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.tableView.frame), CGRectGetWidth(self.frame), pageControlHeight)];
    [self.pageControl setHidesForSinglePage:YES];
    [self.pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
    [self.pageControl setCurrentPageIndicatorTintColor:[UIColor blackColor]];
    [self.pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    self.pageControl.backgroundColor = [UIColor blueColor];
    [self addSubview:self.pageControl];
    
    // Bind Data for Page Control
    self.pageControl.numberOfPages = 3;
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

    NSLog(@"page changed to: %d", self.pageControl.currentPage);
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger targetPage = [[[self.tableView indexPathsForVisibleRows] firstObject] row];
    [self updatePageIndex:targetPage];
}


#pragma mark - TableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetWidth(tableView.frame);
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HorizontalScrollCell *cell = [[HorizontalScrollCell alloc] initWithFrame:tableView.frame];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(tableView.frame.origin.x + 10, tableView.frame.origin.y + 10, tableView.frame.size.width - 20, tableView.frame.size.height - 20)];
    label.text = [NSString stringWithFormat:@"index : %d", indexPath.row];
    label.backgroundColor = [UIColor whiteColor];
    [cell.contentView addSubview:label];
    
    NSLog(@"HorizontalScrollView indexPath row: %d", indexPath.row);
    
    return cell;
}

@end
