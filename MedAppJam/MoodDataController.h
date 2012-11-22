//
//  MoodDataController.h
//  MedAppJam
//
//  Created by AppJam on 11/18/12.
//  Copyright (c) 2012 AppJam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoodDataController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    @private
    NSMutableArray* arrayOfEntries;
}

@property (strong, nonatomic) NSMutableArray* arrayOfEntries;
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end
