//
//  NotifierAppDelegate.h
//  Notifier
//
//  Created by Brandon Trebitowski on 7/29/10.
//  Copyright RightSprite 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoodTrackerController.h"

@class NotifierViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate, MoodTrackerDelegate> {
    UIWindow *window;
    NotifierViewController *viewController;
@private
    NSMutableArray* arrayOfEntries;
}

@property (strong, nonatomic) NSMutableArray* arrayOfEntries;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NotifierViewController *viewController;

-(void) saveArrayOfEntries: (NSMutableArray*) array;

@end

