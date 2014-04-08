//
//  ViewController.m
//  4WayScrollView
//
//  Created by Yongwei on 4/2/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "ViewController.h"
#import "MixScrollView.h"
#import "VerticalScrollCell.h"
#import "ItemViewCellBase.h"

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
    
    MixScrollView *mixScrollView = [[MixScrollView alloc] initWithFrame:self.view.frame];
    mixScrollView.delegate = self;
    mixScrollView.dataSource = self;
    
    [self.view addSubview:mixScrollView];
    
}


#pragma mark - MixScrollViewDataSource

-(NSInteger)numberOfActivities
{
    return 5;
}

-(NSInteger)numberOfItemsInActivity:(NSInteger)activity
{
    return 4;
}

-(ItemViewCellBase *)itemViewCellAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(ItemViewCellBase *)itemTableView:(UITableView *)itemTableView itemCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [NSString stringWithFormat:@"cellIdentifier-%@", @"ExampleCellClass"];
    
    ItemViewCellBase *cell = [itemTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[ItemViewCellBase alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
#if DEBUG
    cell.contentView.backgroundColor = [UIColor purpleColor];
#endif
    cell.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    
#if DEBUG
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, itemTableView.frame.size.width - 20, itemTableView.frame.size.height - 20)];
    label.text = [NSString stringWithFormat:@"index : %ld", (long)indexPath.row];
    label.backgroundColor = [UIColor whiteColor];
    [cell.contentView addSubview:label];
#endif

    return cell;
}

-(UIView *)staticViewAtActivity:(NSInteger)activity
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor grayColor];

    return view;
}

#pragma mark - MixScrollViewDelegate

-(CGFloat)heightForPageControlAtActivity:(NSInteger)activity
{
    return 20.0f;
}

-(CGFloat)heightForStaticViewAtActivity:(NSInteger)activity
{
    return 200.0f;
}

-(CGFloat)heightPercentForViewAtActivity:(NSInteger)activity
{
    return 0.9f;
}


@end
