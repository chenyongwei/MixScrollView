//
//  MixScrollView.m
//  MixScrollView
//
//  Created by Yongwei on 4/4/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "MixScrollView.h"
#import "VerticalScrollCell.h"

@interface MixScrollView () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MixScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup:frame];
    }
    return self;
}


-(void)setup:(CGRect)frame
{
    CGRect aFrame = frame;
    // Table View
    self.tableView = [[UITableView alloc] initWithFrame:aFrame];
    self.tableView.scrollsToTop = NO;
    self.tableView.pagingEnabled = YES;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self addSubview:self.tableView];
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    [self.tableView setContentOffset:CGPointMake(0, CGRectGetHeight(self.tableView.frame)) animated:NO];
//}

#pragma mark - MixScrollViewDataSource

-(NSInteger)numberOfActivitiesInMixScrollView:(MixScrollView *)mixScrollView
{
    return 5;
}

-(NSInteger)mixScrollView:(MixScrollView *)mixScrollView numberOfItemsInActivity:(NSInteger)activity
{
    return 3;
}

-(UIView *)mixScrollView:(MixScrollView *)mixScrollView viewForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat innerViewHeightPercent = [self mixScrollView:self heightPercentInActivity:indexPath.row];
    
    VerticalScrollCell *cell = [[VerticalScrollCell alloc] initWithFrame:self.tableView.frame innerViewHeightPercent:innerViewHeightPercent activity:indexPath.row];
    
    return cell;
}

#pragma mark - MixScrollViewDelegate

-(CGFloat)mixScrollView:(MixScrollView *)mixScrollView heightForStaticViewAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

-(UIView *)mixScrollView:(MixScrollView *)mixScrollView staticViewInActivity:(NSInteger)activity
{
    return nil;
}

-(CGFloat)mixScrollView:(MixScrollView *)mixScrollView heightPercentInActivity:(NSInteger)activity
{
    return 1.0f;
}



#pragma mark - TableView (Private)

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetHeight(tableView.frame);
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self numberOfActivitiesInMixScrollView:self];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (UITableViewCell *)[self mixScrollView:self viewForItemAtIndexPath:indexPath];
}

@end
