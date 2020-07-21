//
//  SJTestPageViewController.m
//  SJUIKit_Example
//
//  Created by BlueDancer on 2020/2/5.
//  Copyright © 2020 changsanjiang@gmail.com. All rights reserved.
//

#import "SJTestPageViewController.h"
#import "SJTestViewController2.h"
#import <SJUIKit/SJPageViewController.h>
#import <Masonry/Masonry.h>

@interface SJHeaderView : UIImageView

@end

@implementation SJHeaderView
//- (void)setFrame:(CGRect)frame {
//    [super setFrame:frame];
//    NSLog(@"%@", NSStringFromCGRect(frame));
//}
@end

@interface SJTestPageViewController ()<SJPageViewControllerDataSource, SJPageViewControllerDelegate>
@property (nonatomic, strong, readonly) SJPageViewController *pageViewController;
@property (nonatomic, strong, readonly) SJHeaderView *headerView;
@end

@implementation SJTestPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blackColor;
    _pageViewController = [SJPageViewController.alloc initWithOptions:@{SJPageViewControllerOptionInterPageSpacingKey:@(3)}];
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [_pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.offset(0);
        make.width.equalTo(self.view);//.multipliedBy(0.5);
    }];
}

- (NSUInteger)numberOfViewControllersInPageViewController:(SJPageViewController *)pageViewController {
    return 3;
}

- (UIViewController *)pageViewController:(SJPageViewController *)pageViewController viewControllerAtIndex:(NSInteger)index {
    UIViewController *vc = SJTestViewController2.new;
    return vc;
}

- (UIView *)viewForHeaderWithPageViewController:(SJPageViewController *)pageViewController {
    SJHeaderView *headerView = [SJHeaderView.alloc initWithFrame:CGRectZero];
    headerView.clipsToBounds = YES;
    headerView.image = [UIImage imageNamed:@"1"];
    headerView.contentMode = UIViewContentModeScaleAspectFill;
    headerView.backgroundColor = UIColor.redColor;
    return headerView;
}

- (CGFloat)heightForHeaderBoundsWithPageViewController:(SJPageViewController *)pageViewController {
    return 120;
}

- (CGFloat)heightForHeaderPinToVisibleBoundsWithPageViewController:(SJPageViewController *)pageViewController {
    return 40;
}

- (SJPageViewControllerHeaderMode)modeForHeaderWithPageViewController:(SJPageViewController *)pageViewController {
    return SJPageViewControllerHeaderModePinnedToTop;
}

- (void)pageViewController:(SJPageViewController *)pageViewController progressForHeaderScrollOffsetDidChange:(CGFloat)progress {
    NSLog(@"%lf", progress);
}
@end
