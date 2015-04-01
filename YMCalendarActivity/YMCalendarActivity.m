//
//  YMCalendarActivity.m
//  YMCalendarActivity
//
//  Copyright (c) 2013-2014 Yusuke Miyazaki. All rights reserved.
//

#import "YMCalendarActivity.h"
#import "YMCalendarActivityEvent.h"

@interface YMCalendarActivity () {
    EKEventEditViewController *viewController;
}

@end

@implementation YMCalendarActivity

- (NSString *)activityType {
    return NSStringFromClass([self class]);
}

- (NSString *)activityTitle {
    return NSLocalizedString(@"Add to Calendar", nil);
}

- (UIImage *)activityImage {
    float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (iOSVersion >= 7.0) {
        return [UIImage imageNamed:@"Calendar.png"];
    } else {
        return [UIImage imageNamed:@"Calendar-6.png"];
    }
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[YMCalendarActivityEvent class]]) {
            return YES;
        }
    }
    return  NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id activityItem in activityItems) {
        if ([activityItem isKindOfClass:[YMCalendarActivityEvent class]]) {
            YMCalendarActivityEvent *event = activityItem;
            
            if (viewController == nil) {
                EKEventStore *es = [[EKEventStore alloc] init];
                EKEvent *e = [EKEvent eventWithEventStore:es];
                e.title = event.title;
                e.location = event.location;
                e.notes = event.notes;
                e.URL = event.URL;
                e.timeZone = event.timeZone;
                e.startDate = event.startDate;
                e.endDate = event.endDate;
                e.allDay = event.allDay;
                
                viewController = [[EKEventEditViewController alloc] init];
                viewController.editViewDelegate = self;
                viewController.event = e;
                viewController.eventStore = es;
            }
        }
    }
}

- (UIViewController *)activityViewController {
    return viewController;
}

- (void)activityDidFinish:(BOOL)completed {
    [super activityDidFinish:completed];
}

- (void)eventEditViewController:(EKEventEditViewController *)controller didCompleteWithAction:(EKEventEditViewAction)action {
    NSError *error = nil;
    
    switch (action) {
        case EKEventEditViewActionSaved:
            [controller.eventStore saveEvent:controller.event span:EKSpanThisEvent error:&error];
            break;
            
        case EKEventEditViewActionCancelled:
            break;
            
        default:
            break;
    }
    
    [self activityDidFinish:YES];
}

@end