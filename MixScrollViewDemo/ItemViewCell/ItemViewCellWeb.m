//
//  ItemViewCellWeb.m
//  MixScrollView
//
//  Created by Yongwei on 4/10/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "ItemViewCellWeb.h"

@implementation ItemViewCellWeb
{
    UIWebView *webView;
}

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
    if (!webView) {
        webView = [[UIWebView alloc] init];
        
        webView.scrollView.scrollEnabled = YES;
        webView.scrollView.bounces = NO;
        webView.allowsInlineMediaPlayback = YES;
        webView.mediaPlaybackAllowsAirPlay = YES;
        webView.mediaPlaybackRequiresUserAction = NO;
        webView.scalesPageToFit = YES;
        webView.userInteractionEnabled = NO;

        [self.contentView addSubview:webView];
    }
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    webView.frame = CGRectMake(0, 0, CGRectGetHeight(frame), CGRectGetWidth(frame));
}

-(void)setData:(id)data
{
    NSString *urlStr = (NSString *)data;
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:urlRequest];
}

@end
