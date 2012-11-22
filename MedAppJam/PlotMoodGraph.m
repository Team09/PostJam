//
//  PlotMoodGraph.m
//  MedAppJam
//
//  Created by App Jam on 11/14/12.
//  Property of Jesse Puente, Milin Shah, Anna Cebula, Derek Wang, and Tom Brown.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import "PlotMoodGraph.h"

@implementation PlotMoodGraph

@synthesize moodPlotPoints;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    CGRect insetRect = CGRectInset(self.frame, 10, 15);
    double maxSpeed = [[moodPlotPoints valueForKeyPath:@"@max.doubleValue"] doubleValue];
    CGFloat yRatio = insetRect.size.height/maxSpeed;
    CGFloat xRatio = insetRect.size.width/(moodPlotPoints.count-1);
    UIBezierPath *sparkline = [UIBezierPath bezierPath];
    for (int x = 0; x< moodPlotPoints.count; x++) {
        CGPoint newPoint = CGPointMake(x*xRatio + insetRect.origin.x, insetRect.size.height - (yRatio*[[moodPlotPoints objectAtIndex:x] doubleValue] - insetRect.origin.y));
        if (x == 0) {
            [sparkline moveToPoint:newPoint];
        }
        else {
            [sparkline addLineToPoint:newPoint];
        }
    }
    [[UIColor redColor] set];
    [sparkline stroke];
}


@end
