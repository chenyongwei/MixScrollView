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
{
    NSInteger currentDisplayCellIndex;
}

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

#pragma mark - TableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetHeight(tableView.frame);
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource numberOfActivities];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger indexPathActivity = indexPath.row;
    CGFloat activityViewHeight = [self.delegate heightPercentForViewAtActivity:indexPathActivity] * CGRectGetHeight(self.tableView.frame);
    // make activity cell centered
    CGRect activityCellFrame = CGRectMake(
                                          self.tableView.frame.origin.x,
                                          self.tableView.frame.origin.y + (CGRectGetHeight(self.tableView.frame) - activityViewHeight) /2 ,
                                          CGRectGetWidth(self.tableView.frame),
                                          activityViewHeight);
    
    VerticalScrollCell *cell = [[VerticalScrollCell alloc] initWithFrame:activityCellFrame forActivity:indexPathActivity withDataSource:self.dataSource andDelegate:self.delegate];
    
    return cell;
}


#pragma mark - ScrollView Delegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        currentDisplayCellIndex = (int) (scrollView.contentOffset.y / CGRectGetHeight(scrollView.frame));
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        NSInteger willDisplayCellIndex = (int) (scrollView.contentOffset.y / CGRectGetHeight(scrollView.frame));
//        NSLog(@"current index = %d, next index = %d", currentDisplayCellIndex, willDisplayCellIndex);
        if (willDisplayCellIndex > currentDisplayCellIndex) {
            // move to next
            [self.delegate scrollToNext];
        }
        else if(willDisplayCellIndex < currentDisplayCellIndex) {
            // move to previous
            [self.delegate scrollToPrevious];
        }
    }
}

@end
