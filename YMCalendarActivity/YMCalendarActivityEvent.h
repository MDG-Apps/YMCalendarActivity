//
//  YMCalendarActivityEvent.h
//  YMCalendarActivityDemo
//
//  Copyright (c) 2013-2014 Yusuke Miyazaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YMCalendarActivityEvent : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *location;
@property (nonatomic) NSString *notes;
@property (nonatomic) NSURL *URL __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_5_0);

@property (nonatomic) NSTimeZone *timeZone __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_5_0);

@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSDate *endDate;

@end