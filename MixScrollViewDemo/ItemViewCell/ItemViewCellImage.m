//
//  ItemViewCellImage.m
//  MixScrollView
//
//  Created by Yongwei on 4/10/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "ItemViewCellImage.h"

@implementation ItemViewCellImage
{
    UIImageView *imageView;
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
    if (!self.imageView) {
        imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor grayColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.contentView addSubview:imageView];
    }
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];

    imageView.frame = CGRectMake(0, 0, CGRectGetHeight(frame), CGRectGetWidth(frame));
}

-(void)setData:(id)data
{
    NSString *imageName = data;
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg" inDirectory:@"content/image"];
    
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    self.imageView.image = image;
}

@end
