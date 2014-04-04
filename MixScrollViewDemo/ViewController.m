//
//  ViewController.m
//  4WayScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "ViewController.h"
#import "VerticalScrollCell.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setup
{
    CGRect aFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
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

@end
