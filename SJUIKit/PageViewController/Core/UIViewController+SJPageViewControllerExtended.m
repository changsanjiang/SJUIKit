//
//  UIViewController+SJPageViewControllerExtended.m
//  Pods
//
//  Created by BlueDancer on 2020/2/5.
//

#import "UIViewController+SJPageViewControllerExtended.h"
#import <objc/message.h>

NS_ASSUME_NONNULL_BEGIN
@implementation UIViewController (SJPageViewControllerExtended)
- (nullable __kindof UIScrollView *)sj_lookupScrollView {
    return [self _sj_pageLookupScrollView:self.view];
}

- (nullable __kindof UIScrollView *)_sj_pageLookupScrollView:(__kindof UIView *)view {
    if ( [view isKindOfClass:UIScrollView.class] )
        return view;
    
    for ( __kindof UIView *subview in view.subviews ) {
        if ( [subview isKindOfClass:UIScrollView.class] ) {
            return subview;
        }
    }
    
    __kindof UIScrollView *target = nil;
    for ( __kindof UIView *subview in view.subviews ) {
        target = [self _sj_pageLookupScrollView:subview];
        if ( target != nil ) return target;
    }
    return nil;
}

- (void)setSj_scrollViewItem:(nullable SJPageScrollViewItem *)sj_scrollViewItem {
    objc_setAssociatedObject(self, @selector(sj_scrollViewItem), sj_scrollViewItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (nullable SJPageScrollViewItem *)sj_scrollViewItem {
    return objc_getAssociatedObject(self, _cmd);
}
@end

@implementation SJPageScrollViewItem

@end
NS_ASSUME_NONNULL_END
