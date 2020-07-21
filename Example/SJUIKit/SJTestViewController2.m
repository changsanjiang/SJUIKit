//
//  SJTestViewController2.m
//  SJUIKit_Example
//
//  Created by BlueDancer on 2020/2/5.
//  Copyright © 2020 changsanjiang@gmail.com. All rights reserved.
//

#import "SJTestViewController2.h"
#import <Masonry/Masonry.h>

static NSString *cellid = @"1";


@interface SJTableView : UITableView

@end

@implementation SJTableView

//- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated {
//    [super setContentOffset:contentOffset animated:animated];
//#ifdef DEBUG
//    NSLog(@"%d \t %s", (int)__LINE__, __func__);
//#endif
//}
//
//- (void)setContentOffset:(CGPoint)contentOffset {
//    NSLog(@"%@", NSStringFromCGPoint(contentOffset));
//    [super setContentOffset:contentOffset];
//}

@end

@interface SJTestViewController2 ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation SJTestViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColor.redColor;
    
    _tableView = [SJTableView.alloc initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.rowHeight = 44;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellid];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//#ifdef DEBUG
//        NSLog(@"%d \t %s \t %p", (int)__LINE__, __func__, self);
//#endif
//        
//        [self.tableView setContentOffset:CGPointMake(0, 400) animated:NO];
//        
//    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 99;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:cellid forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
}
@end
