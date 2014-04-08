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

-(NSInteger)numberOfActivitiesInMixScrollView:(MixScrollView *)mixScrollView
{
    return 5;
}

-(NSInteger)numberOfItemsInActivity:(NSInteger)activity
{
    return 3;
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

-(UIView *)staticViewAtActivity:(NSInteger)activity
{
    return nil;
}

-(CGFloat)heightPercentForViewAtActivity:(NSInteger)activity
{
    return 0.9f;
}


@end
