//
//  MixScrollViewController.m
//  MixScrollView
//
//  Created by Yongwei on 4/4/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "MixScrollViewController.h"
#import "VerticalScrollCell.h"

@interface MixScrollViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MixScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setup:self.view.frame];
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
    
    [self.view addSubview:self.tableView];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
