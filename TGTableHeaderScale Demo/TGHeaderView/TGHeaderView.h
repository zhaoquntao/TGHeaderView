//
//  TGHeaderView.h
//  TGTableHeaderScale Demo
//
//  Created by 赵群涛 on 2018/5/19.
//  Copyright © 2018年 赵群涛. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TGHeaderView : UIView


+ (instancetype)loadSetupForCustomSubView:(id _Nonnull)subView
                              HeaderViewWithSize:(CGSize)size;


- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset;

@end
