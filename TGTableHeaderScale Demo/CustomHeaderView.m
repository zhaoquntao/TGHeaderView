//
//  CustomHeaderView.m
//  TGTableHeaderScale Demo
//
//  Created by 赵群涛 on 2018/5/19.
//  Copyright © 2018年 赵群涛. All rights reserved.
//

#import "CustomHeaderView.h"

@implementation CustomHeaderView

+ (instancetype) shareCustomHeaderView{
    return [[[NSBundle mainBundle] loadNibNamed:@"CustomHeaderView" owner:self options:nil] firstObject];
}

@end
