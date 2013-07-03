//
//  YMCalendarActivity.m
//  YMCalendarActivity
//
//  Created by Yusuke Miyazaki on 2013/07/04.
//  Copyright (c) 2013 Yusuke Miyazaki. All rights reserved.
//

#import "YMCalendarActivity.h"
#import "YMCalendarActivityEvent.h"

@implementation YMCalendarActivity

- (id)init {
    self = [super init];
    
    return self;
}

- (NSString *)activityType {
    return NSStringFromClass([self class]);
}

- (NSString *)activityTitle {
    return @"Add to Calendar";
}

- (UIImage *)activityImage {
    return nil;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for (YMCalendarActivityEvent *event in activityItems) {
        if (viewController == nil) {
            viewController = [[EKEventEditViewController alloc] init];
            
            EKEventStore *es = [[EKEventStore alloc] init];
            [es requestAccessToEntityType:EKEntityTypeEvent
                               completion:^(BOOL granted, NSError *error) {
                                   if (granted) {
                                       EKEvent *e = [EKEvent eventWithEventStore:es];
                                       e.title = event.title;
                                       e.location = event.location;
                                       e.notes = event.notes;
                                       e.URL = event.URL;
                                       e.timeZone = event.timeZone;
                                       e.startDate = event.startDate;
                                       e.endDate = event.endDate;
                                       
                                       viewController.eventStore = es;
                                       viewController.event = e;
                                   }
                                   
                                   viewController.editViewDelegate = self;
                               }];
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
