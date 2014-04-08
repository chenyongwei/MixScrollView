//
//  ItemViewCellBase.m
//  MixScrollView
//
//  Created by Yongwei on 9/4/14.
//  Copyright (c) 2014 Kingway. All rights reserved.
//

#import "ItemViewCellBase.h"

@implementation ItemViewCellBase

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
