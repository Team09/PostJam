//
//  Resources.m
//  MedAppJam
//
//  Created by dwang9 on 11/11/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import "Resources.h"

@implementation Resources

//If the user clicks the Mental Health Screenings button, open the following URL
- (IBAction)MentalHealthScreeningsButton:(id)sender {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.mentalhealthscreening.org/screening/?keyword=UCIRVINE"]];
}

//If the user clicks the NIMH button, open the following URL
- (IBAction)NIMHButton:(id)sender {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.nimh.nih.gov/index.shtml"]];
}

//If the user clicks the NIMH - Depression button, open the following URL
- (IBAction)NIMHDepressionButton:(id)sender {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.nimh.nih.gov/health/topics/depression/index.shtml"]];
}

//If the user clicks the NIMH - Anxiety button, open the following URL
- (IBAction)NIMHAnxietyButton:(id)sender {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.nimh.nih.gov/health/topics/anxiety-disorders/index.shtml"]];
}

//If the user clicks the ADAA button, open the following URL
- (IBAction)ADAAButton:(id)sender {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.adaa.org/"]];
}

//If the user clicks the SAMHSA button, open the following URL
- (IBAction)SAMHSAButton:(id)sender {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"http://www.samhsa.gov/"]];
}
@end
