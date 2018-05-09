//
//  DiscoverBottomSubView.m
//  大麦
//
//  Created by 洪欣 on 16/12/23.
//  Copyright © 2016年 洪欣. All rights reserved.
//

#import "DiscoverBottomSubView.h"

@implementation DiscoverBottomSubView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_camera_capture_pressed"]];
    [self addSubview:icon];
    
    UIImageView *subIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_camera_flash_on"]];
    [icon addSubview:subIcon];
}

@end
