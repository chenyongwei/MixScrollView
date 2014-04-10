//
//  ItemViewCellWeb.m
//  MixScrollView
//
//  Created by Yongwei on 4/10/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "ItemViewCellWeb.h"

@interface ItemViewCellWeb ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ItemViewCellWeb

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    if (!self.webView) {
        self.webView = [[UIWebView alloc] init];
        
        self.webView.scrollView.scrollEnabled = YES;
        self.webView.scrollView.bounces = NO;
        self.webView.allowsInlineMediaPlayback = YES;
        self.webView.mediaPlaybackAllowsAirPlay = YES;
        self.webView.mediaPlaybackRequiresUserAction = NO;
        self.webView.scalesPageToFit = YES;
        self.webView.userInteractionEnabled = NO;

        [self.contentView addSubview:self.webView];
    }
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    self.webView.frame = CGRectMake(0, 0, CGRectGetHeight(frame), CGRectGetWidth(frame));
}

-(void)setData:(id)data
{
    NSString *urlStr = (NSString *)data;
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:urlRequest];
}

@end
