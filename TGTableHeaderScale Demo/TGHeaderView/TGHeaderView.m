//
//  TGHeaderView.m
//  TGTableHeaderScale Demo
//
//  Created by 赵群涛 on 2018/5/19.
//  Copyright © 2018年 赵群涛. All rights reserved.
//

#import "TGHeaderView.h"


@interface TGHeaderView () <UIScrollViewDelegate>
@property (nonatomic, weak)    UITableView *tableView;
@property (weak, nonatomic)  UIScrollView  *scrollView;
@end

@implementation TGHeaderView


+ (instancetype)loadSetupForCustomSubView:(id _Nonnull)subView
                              HeaderViewWithSize:(CGSize)size{
    TGHeaderView *headerView = [[TGHeaderView alloc] initWithFrame:(CGRect){CGPointZero,size}];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [headerView initialSetupForCustomSubView:subView];
        [headerView layoutHeaderViewForScrollViewOffset:CGPointZero];
        headerView.tableView = (id)headerView.superview;
    });
    return headerView;
}



- (void)initialSetupForCustomSubView:(UIView *)subView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scrollView = scrollView;
    //self.subView.frame = self.frame;
    subView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    [self.scrollView addSubview:subView];
    [self addSubview:self.scrollView];
}

- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset{
    CGFloat delta = 0.0f;
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    delta = fabs(MIN(0.0f, offset.y));
    rect.size.height += delta;
    rect.origin.y = offset.y;
    self.scrollView.frame = rect;
    self.clipsToBounds = offset.y > 0;
    
}



@end
