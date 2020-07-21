//
//  SJFoundationExtended.m
//  SJUIKit_Tests
//
//  Created by 畅三江 on 2019/10/21.
//  Copyright © 2019 changsanjiang@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <SJUIKit/SJSQLite3+FoundationExtended.h>

@interface SJFoundationExtended : XCTestCase

@end

@implementation SJFoundationExtended

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testString {
    SJSQLite3 *sqlite3 = SJSQLite3.shared;
    NSError *error = nil;
    
    NSString *key = @"tt1";
    NSString *value = @"2312dsfsd";
    [sqlite3 save:value forKey:key error:&error];
    XCTAssert(error == nil);
    
    NSString *result = [sqlite3 stringForKey:key];
    XCTAssert([result isEqual:value]);
}

- (void)testArray {
    SJSQLite3 *sqlite3 = SJSQLite3.shared;
    NSError *error = nil;
    
    NSString *key = @"tt2";
    NSArray *value = @[@1, @2, @3, @4, @5];
    [sqlite3 save:value forKey:key error:&error];
    XCTAssert(error == nil);
    
    NSArray *result = [sqlite3 arrayForKey:key];
    XCTAssert([result isEqual:value]);
}

- (void)testDict {
    SJSQLite3 *sqlite3 = SJSQLite3.shared;
    NSError *error = nil;
    
    NSString *key = @"tt3";
    NSDictionary *value = @{@"llll":@[@1, @2, @3, @4, @5]};
    [sqlite3 save:value forKey:key error:&error];
    XCTAssert(error == nil);
    
    NSDictionary *result = [sqlite3 dictionaryForKey:key];
    XCTAssert([result isEqual:value]);
}

- (void)testInteger {
    SJSQLite3 *sqlite3 = SJSQLite3.shared;
    NSError *error = nil;
    
    NSString *key = @"t1";
    NSInteger value = 123321;
    [sqlite3 save:@(value) forKey:key error:&error];
    XCTAssert(error == nil);
    
    NSInteger result = [sqlite3 integerForKey:key];
    XCTAssert(result == value);
}

- (void)testFloat {
    SJSQLite3 *sqlite3 = SJSQLite3.shared;
    NSError *error = nil;
    
    NSString *key = @"t2";
    float value = 123.12;
    [sqlite3 save:@(value) forKey:key error:&error];
    XCTAssert(error == nil);
    
    float result = [sqlite3 floatForKey:key];
    XCTAssert(result == value);
}

- (void)testDouble {
    SJSQLite3 *sqlite3 = SJSQLite3.shared;
    NSError *error = nil;
    
    NSString *key = @"t3";
    double value = 123.12;
    [sqlite3 save:@(value) forKey:key error:&error];
    XCTAssert(error == nil);
    
    double result = [sqlite3 doubleForKey:key];
    XCTAssert(result == value);
}

- (void)testBool {
    SJSQLite3 *sqlite3 = SJSQLite3.shared;
    NSError *error = nil;
    
    NSString *key = @"t4";
    BOOL value = true;
    [sqlite3 save:@(value) forKey:key error:&error];
    XCTAssert(error == nil);
    
    BOOL result = [sqlite3 boolForKey:key];
    XCTAssert(result == value);
}

- (void)testURL {
    SJSQLite3 *sqlite3 = SJSQLite3.shared;
    NSError *error = nil;
    
    NSString *key = @"t5";
    NSURL *value = [NSURL URLWithString:@"http://www.baidu.com"];
    [sqlite3 save:value forKey:key error:&error];
    XCTAssert(error == nil);
    
    NSURL *result = [sqlite3 URLForKey:key];
    XCTAssert([result isEqual:value]);
}

- (void)testJsonString {
    SJSQLite3 *sqlite3 = SJSQLite3.shared;

    NSLog(@"%@", [sqlite3 jsonStringForKey:@"tt1"]);
}

- (void)testRemove {
    SJSQLite3 *sqlite3 = SJSQLite3.shared;
    [sqlite3 removeValueForKey:@"t1" error:NULL];
}
@end
