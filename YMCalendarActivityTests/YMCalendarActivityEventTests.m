//
//  YMCalendarActivityEventTests.m
//  YMCalendarActivity
//
//  Copyright (c) 2014 Yusuke Miyazaki. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "YMCalendarActivityEvent.h"

@interface YMCalendarActivityEventTests : SenTestCase {
    YMCalendarActivityEvent *event;
}

@end

@implementation YMCalendarActivityEventTests

- (void)setUp {
    [super setUp];

    event = [[YMCalendarActivityEvent alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test {
    NSString *title = @"Title";
    NSString *location = @"Location";
    NSString *notes = @"Notes";
    NSURL *url = [NSURL URLWithString:@"https://github.com/litesystems/YMCalendarActivity"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Tokyo"];
    NSDate *start = [NSDate date];
    NSDate *end = [NSDate dateWithTimeIntervalSinceNow:100];
    
    event.title = title;
    event.location = location;
    event.notes = notes;
    event.URL = url;
    event.timeZone = timeZone;
    event.startDate = start;
    event.endDate = end;
    
    STAssertEqualObjects(event.title, title, nil);
    STAssertEqualObjects(event.location, location, nil);
    STAssertEqualObjects(event.notes, notes, nil);
    STAssertEqualObjects(event.timeZone, timeZone, nil);
    STAssertEqualObjects(event.startDate, start, nil);
    STAssertEqualObjects(event.endDate, end, nil);
}

@end