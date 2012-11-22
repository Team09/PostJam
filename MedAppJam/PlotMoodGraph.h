//
//  PlotMoodGraph.h
//  MedAppJam
//
//  Created by App Jam on 11/14/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlotMoodGraph : UIView {
    
    @private
    NSArray *moodPlotPoints;
}

@property(strong, atomic) NSArray *moodPlotPoints;



@end
