//
//  MoodInputController3.m
//  MedAppJam
//
//  Created by App Jam on 11/14/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import "MoodInputController3.h"
#import "MoodEntry.h"

@interface MoodInputController3 ()

@end

@implementation MoodInputController3

@synthesize entry;
@synthesize rootController;
@synthesize delegate;
@synthesize notesInput;

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
    self.notesInput.delegate = (id) self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (IBAction)cancel:(id)sender {
    [self.rootController dismissModalViewControllerAnimated:YES];
}
- (IBAction)back:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)ok:(id)sender {

    self.entry.notes = self.notesInput.text;
    
    [self.rootController dismissModalViewControllerAnimated:YES];
    [self.delegate passEntry: self.entry];
}
- (void)viewDidUnload {
    notesInput = nil;
    [super viewDidUnload];
}
@end
