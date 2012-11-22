//
//  GetHelp.m
//  MedAppJam
//
//  Created by dwang9 on 11/11/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import "GetHelp.h"

@implementation GetHelp
{
    
}

- (IBAction)emergencyCall:(UIButton *)sender
{
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Are About To Call 911."
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Continue",nil];
    [alert show];
    
    
}

- (IBAction)nationalCall:(id)sender
{
    //Placeholder phone number - this is Anna's cell
   NSString *phoneNumber = @"tel:9496370298"; 
//    NSString *phoneNumber = @"tel:18002738255";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    
    
}

- (IBAction)nationalWarmCall:(id)sender
{
    //Placeholder phone number - this is Anna's cell
    NSString *phoneNumber = @"tel:9496370298";

    //this is the national warmline network
    //NSString *phoneNumber = @"tel:18779109276";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}	

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSLog(@"%d", buttonIndex);
    if(buttonIndex==1)
    {
        //Placeholder phone number - this is Anna's cell
        NSString *phoneNumber = @"tel:9496370298";

        
//        NSString *phoneNumber = @"tel:911";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    }
    
    
}

@end
