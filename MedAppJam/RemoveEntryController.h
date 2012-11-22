//
//  RemoveEntryController.h
//  MedAppJam
//
//  Created by App Jam on 11/18/12.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoodEntry;

@protocol RemoveEntryDelegate <NSObject>
@required
- (void) removeEntryFromArray: (MoodEntry*) entry;

@end

@interface RemoveEntryController : UIViewController
{
    @private
    MoodEntry* entry;
    UIViewController* rootController;
    IBOutlet UIDatePicker *datePicker;
}

@property (strong, nonatomic) UIViewController* rootController;
@property (strong, nonatomic) MoodEntry* entry;
@property (weak) id <RemoveEntryDelegate> delegate;
- (IBAction)remove:(id)sender;
- (IBAction)back:(id)sender;
- (IBAction)cancel:(id)sender;

@end
