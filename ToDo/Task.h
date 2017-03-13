//
//  Task.h
//  ToDo
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Task : NSManagedObject
@property (nonatomic, retain) NSString * taskName;
@property (nonatomic, retain) NSString * uniqueID;

@end
