//
//  MoodEntry.h
//  MedAppJam
//
//  Created by App Jam on 11/14/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoodEntry : NSObject
{
@private
    int mood;
    NSDate* date;
    NSString* notes;
}



@property NSDate* date;
@property NSString* notes;
@property int mood;


@end