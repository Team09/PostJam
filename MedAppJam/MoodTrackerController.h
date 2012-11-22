//
//  MoodTrackerController.h
//  MedAppJam
//
//  Created by App Jam on 11/13/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoodInputController3.h"

@class MoodEntry;

@protocol MoodTrackerDelegate <NSObject>
@required
- (id) saveArrayOfEntries: (NSMutableArray*) array;
@end

@interface MoodTrackerController : UIViewController <MoodInputDelegate>
{
@private
    NSMutableArray* arrayOfEntries;
    BOOL contains;

    
}

@property (weak) id <MoodTrackerDelegate> delegate;
@property (strong, nonatomic) NSMutableArray* arrayOfEntries;
@property (assign, nonatomic) BOOL contains;

- (void) removeEntryFromArray: (MoodEntry*) entry;
- (IBAction)removeEntry:(id)sender;
- (IBAction)InputInformation:(id)sender;
- (void) passEntry: (MoodEntry*) entry;
- (IBAction)returnToMenu:(id)sender;
- (IBAction)viewPreviousEntries:(id)sender;




@end
