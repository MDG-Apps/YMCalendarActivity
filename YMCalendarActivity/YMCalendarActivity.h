//
//  YMCalendarActivity.h
//  YMCalendarActivity
//
//  Created by Yusuke Miyazaki on 2013/07/04.
//  Copyright (c) 2013 Yusuke Miyazaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKitUI/EventKitUI.h>

#import "YMCalendarActivityEvent.h"

@interface YMCalendarActivity : UIActivity <EKEventEditViewDelegate> {
    EKEventEditViewController *viewController;
}

@end
