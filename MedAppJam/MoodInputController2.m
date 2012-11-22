//
//  MoodInputController2.m
//  MedAppJam
//
//  Created by App Jam on 11/13/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import "MoodInputController2.h"
#import "MoodInputController3.h"
#import "MoodEntry.h"
#import "MoodTrackerController.h"

@interface MoodInputController2 ()

@end

@implementation MoodInputController2
@synthesize entry;
@synthesize rootController;
@synthesize moodSelector;
@synthesize moodSelectorArray;

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
    self.moodSelectorArray = [[NSArray alloc] initWithObjects: @"Great", @"Good", @"Average", @"Below Average", @"Poor", nil];
    [self.moodSelector selectRow:2 inComponent:0 animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    moodSelector = nil;
    [super viewDidUnload];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString: @"SetMoodInput3"])
    {
        MoodInputController3* controller3 = [segue destinationViewController];

        
        
        
        controller3.entry = self.entry;
        controller3.rootController = self.rootController;
        controller3.delegate = (id) self.rootController;
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

// Overriding methods for pickerView
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return self.moodSelectorArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [self.moodSelectorArray objectAtIndex:row];
}

- (IBAction)cancel:(id)sender {
    [rootController dismissModalViewControllerAnimated: YES];
}
- (IBAction)ok:(id)sender {
    // Get row of selected pickerView
    NSInteger row = [moodSelector selectedRowInComponent:0];
    
    if (row == 0)
        entry.mood = 5;
    else if (row == 1)
        entry.mood = 4;
    else if (row == 2)
        entry.mood = 3;
    else if (row == 3)
        entry.mood = 4;
    else
        entry.mood = 5;
    
    
    [self performSegueWithIdentifier:@"SetMoodInput3" sender: self];
}

- (IBAction)back:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
