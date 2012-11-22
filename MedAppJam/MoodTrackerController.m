//
//  MoodTrackerController.m
//  MedAppJam
//
//  Created by App Jam on 11/13/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import "MoodTrackerController.h"
#import "MoodInputController1.h"
#import "MoodEntry.h"
#import "AppDelegate.h"
#import "RemoveEntryController.h"
#import "MoodDataController.h"

@interface MoodTrackerController ()

@end

@implementation MoodTrackerController

@synthesize arrayOfEntries;
@synthesize delegate;
@synthesize contains;



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
    
    AppDelegate* appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    self.arrayOfEntries = appDelegate.arrayOfEntries;
  
    self.delegate = (id) [[UIApplication sharedApplication] delegate];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString: @"SetMoodInput1"])
    {
        MoodInputController1* controller1 = [segue destinationViewController];
        
        controller1.rootController = self;
        
        
    }
    else if([[segue identifier] isEqualToString: @"SetRemoveEntry"])
    {
        RemoveEntryController* controller = [segue destinationViewController];
        controller.rootController = self;
        controller.delegate = (id) self;
    }
    else if ([[segue identifier] isEqualToString: @"SetMoodData"])
    {
        MoodDataController* controller = [segue destinationViewController];
        controller.arrayOfEntries = self.arrayOfEntries;
    }
}

- (void) removeEntryFromArray: (MoodEntry*) entry;
{
    if (arrayOfEntries.count == 0)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @"No Data To Remove" message: @"You currently have no data stored in your Mood Tracker" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        NSInteger index = -1;
        for (MoodEntry* curEntry in arrayOfEntries)
        {
            if ([curEntry.date isEqualToDate: entry.date])
            {
                index = [arrayOfEntries indexOfObject: curEntry];
            }
        }
        
        if (index == -1)
        {
            UIAlertView* alert2 = [[UIAlertView alloc] initWithTitle: @"Entry To Be Removed Was Not Found" message: @"Your Mood Tracker does not contain any entry matching the same date as the input date" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
            [alert2 show];
        }
        else
        {
            [arrayOfEntries removeObjectAtIndex: index];
        }
    
        
    }
    
    [delegate saveArrayOfEntries: self.arrayOfEntries];
  
    
}




- (void) passEntry: (MoodEntry*) entry;
{
    if (self.arrayOfEntries.count == 0)
    {
        [self.arrayOfEntries addObject: entry];
    }
    else
    {
        // Check to see if the array contains an entry with the date that is trying to be added, if so, throw an error message
        self.contains = NO;
        for (MoodEntry* curEntry in self.arrayOfEntries)
        {
            if ([curEntry.date isEqualToDate: entry.date])
            {
                self.contains = YES;
            }
        }
        
        // If the an entry in the array has the same date as the entry trying to be added, an alert will show. If not
        // then the new entry will be added to the array
        if (!self.contains)
        {
            [self.arrayOfEntries addObject: entry];
            self.contains = NO;
        }
        else
        {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @"Duplicate Entry Date" message: @"Your Mood Tracker already contains an entry with the same date. New entry was not added" delegate: nil cancelButtonTitle: @"OK" otherButtonTitles: nil];
            [alert show];
        }
    }
    
    
    
    
    // Creating a comparator and sort the array based on date
    NSComparator comparator = ^NSComparisonResult(MoodEntry* entry1, MoodEntry* entry2)
    {
        return[[entry1 date] compare: [entry2 date]];
    };
    [self.arrayOfEntries sortUsingComparator: comparator];
    
    // Send the arrayOfEntries field to appDelegate, so that it can be stored when the app closes
    [delegate saveArrayOfEntries: self.arrayOfEntries];

}

- (IBAction)returnToMenu:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)viewPreviousEntries:(id)sender {
    [self performSegueWithIdentifier: @"SetMoodData" sender: self];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (IBAction)removeEntry:(id)sender {
    [self performSegueWithIdentifier: @"SetRemoveEntry" sender:self];
}

- (IBAction)InputInformation:(id)sender {
    [self performSegueWithIdentifier:@"SetMoodInput1" sender: self];
    
}



@end
