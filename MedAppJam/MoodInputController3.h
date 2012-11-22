//
//  MoodInputController3.h
//  MedAppJam
//
//  Created by App Jam on 11/14/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MoodEntry, MoodTrackerController;

@protocol MoodInputDelegate
@required
- (void) passEntry: (MoodEntry*) entry;
@end

@interface MoodInputController3 : UIViewController <UITextFieldDelegate>
{
@private
    MoodEntry* entry;
    UIViewController* rootController;
    IBOutlet UITextView *notesInput;
}

@property (weak, nonatomic) id <MoodInputDelegate> delegate;
@property (strong, nonatomic) MoodEntry* entry;
@property (strong, nonatomic) UIViewController* rootController;
@property (strong, nonatomic) IBOutlet UITextView *notesInput;
- (IBAction)cancel:(id)sender;
- (IBAction)back:(id)sender;
- (IBAction)ok:(id)sender;

@end
