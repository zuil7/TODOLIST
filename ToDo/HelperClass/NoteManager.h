//
//  NoteManager.h
//  NotepadApp
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NoteManager : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (NoteManager *) sharedInstance;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
