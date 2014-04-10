//
//  ItemViewCellImage.m
//  MixScrollView
//
//  Created by Yongwei on 4/10/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "ItemViewCellImage.h"

@interface ItemViewCellImage ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ItemViewCellImage


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
        self.imageView = [[UIImageView alloc] init];
        self.imageView.backgroundColor = [UIColor grayColor];
        
        [self.contentView addSubview:self.imageView];
    }
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];

    self.imageView.frame = CGRectMake(0, 0, CGRectGetHeight(frame), CGRectGetWidth(frame));
}

-(void)setData:(id)data
{
    NSString *imageName = data;
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg" inDirectory:@"content/image"];
    
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    self.imageView.image = image;
}

@end
