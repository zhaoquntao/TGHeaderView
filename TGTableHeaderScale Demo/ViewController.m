//
//  ViewController.m
//  TGTableHeaderScale Demo
//
//  Created by 赵群涛 on 2018/5/19.
//  Copyright © 2018年 赵群涛. All rights reserved.
//

#import "ViewController.h"
#import "TGHeaderView.h"
#import "CustomHeaderView.h"
#import "UIView+Layout.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong)CustomHeaderView *headerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomHeaderView *hederView = [CustomHeaderView shareCustomHeaderView];
    hederView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
    self.headerView = hederView;
    
    self.tableView.tableHeaderView = [TGHeaderView loadSetupForCustomSubView:hederView HeaderViewWithSize:hederView.size];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"UITableViewCell";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    return cell;
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [((TGHeaderView *)_tableView.tableHeaderView) layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
}


@end
