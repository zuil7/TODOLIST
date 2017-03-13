//
//  NoteManagerHelper.h
//  NotepadApp
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoteManager.h"
#import "Task.h"

@interface NoteManagerHelper : NSObject
+ (NoteManagerHelper *)sharedInstance;
- (void)AddNewNote:(NSDictionary *)params;
- (NSArray *)getNotes;
- (void)deleteCategory:(Task *)obj;

@end
