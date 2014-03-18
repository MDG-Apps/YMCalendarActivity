//
//  ViewController.m
//  YMCalendarActivityDemo
//
//  Copyright (c) 2013-2014 Yusuke Miyazaki. All rights reserved.
//

#import "ViewController.h"

#import "YMCalendarActivity.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //eventStore = [[EKEventStore alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self checkEventStoreAccessForCalendar];
}

- (void)actionButtonPushed:(id)sender {
    NSString *text = @"YMCalendarActivity";
    NSURL *url = [NSURL URLWithString:@"https://github.com/litesystems/YMCalendarActivity"];
    YMCalendarActivityEvent *event = [[YMCalendarActivityEvent alloc] init];
    
    event.title = @"My Event";
    event.location = @"Home";
    event.notes = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
    event.URL = [NSURL URLWithString:@"https://github.com/litesystems/YMCalendarActivity"];
    event.timeZone = [NSTimeZone localTimeZone];
    event.startDate = [NSDate dateWithTimeIntervalSinceNow:60 * 60];
    event.endDate = [NSDate dateWithTimeInterval:60 * 60 sinceDate:event.startDate];
    
    YMCalendarActivity *activity = [[YMCalendarActivity alloc] init];
    UIActivityViewController *avc = [[UIActivityViewController alloc] initWithActivityItems:@[text, url, event]
                                                                      applicationActivities:@[activity]];
    
    [self presentViewController:avc animated:YES completion:nil];
}


- (void)checkEventStoreAccessForCalendar {
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    switch (status) {
        case EKAuthorizationStatusAuthorized:
            break;
        case EKAuthorizationStatusNotDetermined:
            [[[EKEventStore alloc] init] requestAccessToEntityType:EKEntityTypeEvent
                                                        completion:^(BOOL granted, NSError *error) {}];
            break;
        case EKAuthorizationStatusDenied:
            break;
        case EKAuthorizationStatusRestricted:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Privacy Warning"
                                                            message:@"Permission was not granted for Calendar"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            break;
        }
        default:
            break;
    }
}

@end