//
//  SJViewController.m
//  SJUIKit
//
//  Created by changsanjiang@gmail.com on 07/17/2018.
//  Copyright (c) 2018 changsanjiang@gmail.com. All rights reserved.
//

#import "SJViewController.h"
#import "SJBaseViewController.h"
#import "SJRunLoopTaskQueue.h"
#import "SJTestViewController.h"
#import <SJUIKit/SJUIKit.h>
#import "SJTestPageViewController.h"

@interface SJViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    _label.backgroundColor = [UIColor purpleColor];
    _label.numberOfLines = 0;
    _label.attributedText = [NSAttributedString sj_UIKitText:^(id<SJUIKitTextMakerProtocol>  _Nonnull make) {
        make.lineSpacing(30);
        make.font([UIFont systemFontOfSize:14]);
        make.textColor(UIColor.whiteColor);
        make.append(@"测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测测");

//        make.appendImage(^(id<SJUTImageAttachment>  _Nonnull make) {
//            make.image = [UIImage imageNamed:@"1"];
//            make.alignment = SJUTVerticalAlignmentTop;
//        });
//        make.append(@"Top");
//        make.appendImage(^(id<SJUTImageAttachment>  _Nonnull make) {
//            make.image = [UIImage imageNamed:@"1"];
//            make.alignment = SJUTVerticalAlignmentTop;
//        });
//
//        make.append(@"\n");
//        make.appendImage(^(id<SJUTImageAttachment>  _Nonnull make) {
//            make.image = [UIImage imageNamed:@"1"];
//            make.alignment = SJUTVerticalAlignmentCenter;
//        });
//        make.append(@"Center");
//        make.appendImage(^(id<SJUTImageAttachment>  _Nonnull make) {
//            make.image = [UIImage imageNamed:@"1"];
//            make.alignment = SJUTVerticalAlignmentCenter;
//        });
//
//        make.append(@"\n");
//        make.appendImage(^(id<SJUTImageAttachment>  _Nonnull make) {
//            make.image = [UIImage imageNamed:@"1"];
//            make.alignment = SJUTVerticalAlignmentTop;
//        });
//        make.append(@"Top");
//        make.appendImage(^(id<SJUTImageAttachment>  _Nonnull make) {
//            make.image = [UIImage imageNamed:@"1"];
//            make.alignment = SJUTVerticalAlignmentTop;
//        });
//
//        make.append(@"\n");
//        make.appendImage(^(id<SJUTImageAttachment>  _Nonnull make) {
//            make.image = [UIImage imageNamed:@"1"];
//            make.alignment = SJUTVerticalAlignmentBottom;
//        });
//        make.append(@"Bottom");
//        make.appendImage(^(id<SJUTImageAttachment>  _Nonnull make) {
//            make.image = [UIImage imageNamed:@"1"];
//            make.alignment = SJUTVerticalAlignmentBottom;
//        });
    }];
    
}
- (IBAction)push:(id)sender {
    [self.navigationController pushViewController:[SJTestPageViewController new] animated:YES];
//    [self test2];
}

- (void)test2 {
    static int a = 0;
    for ( int i = 0 ; i < 10 ; ++ i ) {
//        SJRunLoopTaskQueue.main.enqueue(^{
//            NSLog(@"%d - -[%@ %s]", (int)__LINE__, NSStringFromClass([self class]), sel_getName(_cmd));
//        });
        
        SJTaskQueue.main.delay(1).enqueue(^{
            NSLog(@"a = %d", ++a);
            
            if ( SJTaskQueue.main.count == 2 )
                SJTaskQueue.main.empty().enqueue(^{
                    NSLog(@"哈哈");
                });
        });
    }
}

- (void)test1 {
    //    for ( int i = 0 ; i < 999 ; ++ i ) {
    //        dispatch_async(dispatch_get_global_queue(0, 0), ^{
    //            SJRunLoopTaskQueue.queue(@"com.test.queue").add(^{
    //#ifdef DEBUG
    //                NSLog(@"%d - -[%@ %s]", (int)__LINE__, NSStringFromClass([self class]), sel_getName(_cmd));
    //#endif
    //            });
    //
    //            SJRunLoopTaskQueue.queue(@"com.test.queue").add(^{
    //#ifdef DEBUG
    //                NSLog(@"%d - -[%@ %s]", (int)__LINE__, NSStringFromClass([self class]), sel_getName(_cmd));
    //#endif
    //            });
    //
    //            SJRunLoopTaskQueue.destroy(@"com.test.queue");
    //        });
    //    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//#ifdef DEBUG
//    NSLog(@"%d - %s", (int)__LINE__, __func__);
//#endif
//    [self test2];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"Hello World!");
//
//    });
//}
@end
