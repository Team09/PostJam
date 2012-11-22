//
//  MoodInputController1.m
//  MedAppJam
//
//  Created by App Jam on 11/13/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import "MoodInputController1.h"
#import "MoodInputController2.h"
#import "MoodEntry.h"
#import "MoodTrackerController.h"

@interface MoodInputController1 ()

@end

@implementation MoodInputController1
@synthesize rootController;
@synthesize entry;
@synthesize datePicker;


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
    NSDate* now = [NSDate date];
    [self.datePicker setDate: now animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    datePicker = nil;
    [super viewDidUnload];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (([[segue identifier] isEqualToString: @"SetMoodInput2"])
        )
    {
        MoodInputController2* controller2 = [segue destinationViewController];
        
        // Create a new instance of MoodEntry
        MoodEntry* newEntry = [[MoodEntry alloc] init];
        self.entry = newEntry;
        
        // Zero out the time component on the NSDate object
        unsigned int dateOnly = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* components = [calendar components:dateOnly fromDate:datePicker.date];
        components.timeZone = [NSTimeZone timeZoneWithAbbreviation: @"UTC"];
        entry.date = [calendar dateFromComponents:components];

        
        // Pass the entry along to the second input screen
        controller2.entry = self.entry;
        controller2.rootController = self.rootController;
    }
}

- (IBAction)cancel:(id)sender {
    [rootController dismissModalViewControllerAnimated:YES];
}

- (IBAction)ok:(id)sender {
    
    [self performSegueWithIdentifier: @"SetMoodInput2" sender:self];
}

- (IBAction)back:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end
