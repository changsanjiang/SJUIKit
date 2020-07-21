//
//  SJTestViewController.m
//  SJUIKit_Example
//
//  Created by BlueDancer on 2019/2/21.
//  Copyright © 2019 changsanjiang@gmail.com. All rights reserved.
//

#import "SJTestViewController.h"
#import "SJRunLoopTaskQueue.h"
#import "SJResidentThread.h"

@interface SJTestViewController ()
@property (nonatomic, strong) SJResidentThread *thread;
@end

@implementation SJTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _thread = [SJResidentThread new];
    // Do any additional setup after loading the view from its nib.
}

static NSString *k = @"k";
- (void)dealloc {
#ifdef DEBUG
    NSLog(@"%d - %s", (int)__LINE__, __func__);
#endif
    SJRunLoopTaskQueue.destroy(k);
}
- (IBAction)test:(id)sender {
    [_thread performBlock:^{
        NSLog(@"%@", self);
    }];
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        for ( int i = 0 ; i < 1000; ++ i ) {
//            dispatch_async(dispatch_get_global_queue(0, 0), ^{
//                SJRunLoopTaskQueue.main.update(CFRunLoopGetMain(), kCFRunLoopDefaultMode);
//            });
//
//            dispatch_async(dispatch_get_global_queue(0, 0), ^{
//                SJRunLoopTaskQueue.main.enqueue(^{
//
//                });
//
//                if ( i == 999 ) {
//                    SJRunLoopTaskQueue.main.enqueue(^{
//                        puts("wan bi");
//                    });
//                }
//            });
//        }
//    });
//#ifdef DEBUG
//    NSLog(@"%d - %s", (int)__LINE__, __func__);
//#endif
}

- (void)test2 {
    NSLog(@"%@", NSThread.currentThread);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
