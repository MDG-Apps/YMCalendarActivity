//
//  YMCalendarActivityEvent.h
//  YMCalendarActivityDemo
//
//  Created by Yusuke Miyazaki on 2013/07/04.
//  Copyright (c) 2013 Yusuke Miyazaki. All rights reserved.
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
