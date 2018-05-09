//
//  DiscoverBottomView.m
//  大麦
//
//  Created by 洪欣 on 16/12/23.
//  Copyright © 2016年 洪欣. All rights reserved.
//

#import "DiscoverBottomView.h"

@implementation DiscoverBottomView

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
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, 200)];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    
    
}

@end
