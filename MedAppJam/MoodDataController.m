//
//  MoodDataController.m
//  MedAppJam
//
//  Created by AppJam on 11/18/12.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import "MoodDataController.h"

@interface MoodDataController ()

@end

@implementation MoodDataController

@synthesize arrayOfEntries;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
	[self.tableview reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [arrayOfEntries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cells";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]autorelease];
    }

    // Configure the cell...
    
	
	
    /*NSString *date1 = notif.fireDate.description;//[notif.fireDate.description subStringWithRange:NSMakeRange(5, 10)];
    NSString *time1 = notif.fireDate.description;//[notif.fireDate.description subStringWithRange:NSMakeRange(12, 17)];
    //NSLog([date1 subStringWithRange:NSMakeRange(5, 10)]);
    date1=[date1 substringWithRange:NSMakeRange(5,6)];
    time1=[time1 substringWithRange:NSMakeRange(11,12)];
    */
    NSLog(indexPath.description);
    NSLog([NSString stringWithFormat:@"%d",arrayOfEntries.count]);
    
    if(arrayOfEntries.count > 0)
    {
        
        NSDate *date =  [[arrayOfEntries objectAtIndex:indexPath.row]date];
        date = [date.description substringWithRange:NSMakeRange(0,10)];
        int mood = [[arrayOfEntries objectAtIndex:indexPath.row]mood];
        NSString *notes = [[arrayOfEntries objectAtIndex:indexPath.row]notes];
        NSString *moodString;
        if(mood == 1)
        {
            moodString = @"Great";
        }
        else if(mood == 2)
        {
            moodString = @"Good";
        }
        else if(mood == 3)
        {
            moodString = @"Average";
        }
        else if(mood == 4)
        {
            moodString = @"Below Avg";
        }
        else if(mood == 5)
        {
            moodString = @"Poor";
        }
        
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@, Mood: %@",date,moodString];
        cell.detailTextLabel.text = notes;
    }	    //[NSString stringWithFormat:@"%@, %@, %@",notif.alertBody,date1,time1]];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    NSLog(@"imHere");
    //[self setTableview:nil];
    [super viewDidUnload];
}
@end
