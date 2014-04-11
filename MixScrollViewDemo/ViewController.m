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
#import "ItemViewCellWeb.h"
#import "ItemViewCellImage.h"

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
    return 3;
}

-(ItemViewCellBase *)createItemViewCell:(NSInteger)item atActivity:(NSInteger)activity reuseIdentifier:(NSString *)cellIdentifier
{
    ItemViewCellBase *cell;
    switch (activity) {
        case 0:
            cell = [[ItemViewCellWeb alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            break;
        case 1:
            cell = [[ItemViewCellImage alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            break;
        default:
            cell = [[ItemViewCellBase alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            break;
    }

    return cell;
}

-(id)dataOfItem:(NSInteger)item atActivity:(NSInteger)activity
{
    id data;
    switch (activity) {
        case 0:
            data = @"http://www.ef.com";
            break;
        case 1:
            switch (item) {
                case 0:
                    data = @"IMG_0150";
                    break;
                case 1:
                    data = @"IMG_0154";
                    break;
                case 2:
                    data = @"IMG_0163";
                    break;
                case 3:
                    data = @"IMG_0169";
                    break;
                case 4:
                    data = @"IMG_0170";
                    break;
                default:
                    data = @"";
                    break;
            }
            break;
        default:
            data = nil;
            break;
    }
    return data;
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
    CGFloat height = 200.0f;
    switch (activity) {
        case 2:
            height = 0.0f;
            break;
            
        default:
            break;
    }
    return height;
}

-(CGFloat)heightPercentForViewAtActivity:(NSInteger)activity
{
    CGFloat height = 0.9f;
    
    switch (activity) {
        case 2:
            height = 1.0f;
            break;
            
        default:
            break;
    }
    
    return height;
}


@end
