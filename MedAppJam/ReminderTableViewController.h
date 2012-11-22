//
//  ReminderTableViewController.h
//  MedAppJam
//
//  Created by jpuente on 11/14/12.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"

@interface ReminderTableViewController : UITableViewController{
    NSMutableArray *reminderArray;
    Class *MyClass;
}

@end
