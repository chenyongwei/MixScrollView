//
//  MixScrollView.m
//  MixScrollView
//
//  Created by Yongwei on 4/4/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "MixScrollView.h"
#import "VerticalScrollCell.h"

@interface MixScrollView ()

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
    CGRect aFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
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
    return 5;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    VerticalScrollCell *cell = [[VerticalScrollCell alloc] initWithFrame:self.tableView.frame innerViewHeightPercent:0.95f];
    
    return cell;
}

#pragma mark - MixScrollView

-(NSInteger)mixScrollView:(MixScrollView *)mixScrollView numberOfColumnsInRow:(NSInteger)row
{
    return 3;
}

-(UIView *)mixScrollView:(MixScrollView *)mixScrollView viewForColumnAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(CGFloat)mixScrollView:(MixScrollView *)mixScrollView heightForColumnAtIndexPath:(NSIndexPath *)indexPath
{
    return 10;
}


@end
