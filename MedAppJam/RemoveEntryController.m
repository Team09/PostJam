//
//  RemoveEntryController.m
//  MedAppJam
//
//  Created by App Jam on 11/18/12.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import "RemoveEntryController.h"
#import "MoodEntry.h"

@interface RemoveEntryController ()

@end

@implementation RemoveEntryController

@synthesize entry;
@synthesize delegate;
@synthesize rootController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)remove:(id)sender {
    
    // Create a new instance of MoodEntry
    MoodEntry* newEntry = [[MoodEntry alloc] init];
    self.entry = newEntry;
    
    // Zero out the time component on the NSDate object
    unsigned int dateOnly = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:dateOnly fromDate:datePicker.date];
    components.timeZone = [NSTimeZone timeZoneWithAbbreviation: @"UTC"];
    entry.date = [calendar dateFromComponents:components];
    
    // Send the entry to be removed back to the delegate
    [self.delegate removeEntryFromArray: entry];
    
    [self dismissModalViewControllerAnimated: YES];
}

- (IBAction)back:(id)sender {
    [self dismissModalViewControllerAnimated: YES];
}

- (IBAction)cancel:(id)sender {
    [rootController dismissModalViewControllerAnimated: YES];
}
- (void)viewDidUnload {
    datePicker = nil;
    [super viewDidUnload];
}
@end
