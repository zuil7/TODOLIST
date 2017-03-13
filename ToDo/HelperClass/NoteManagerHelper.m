//
//  NoteManagerHelper.m
//  NotepadApp
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import "NoteManagerHelper.h"

static NSString * const kNotes    = @"Task"; // User Table

@implementation NoteManagerHelper
+ (NoteManagerHelper *)sharedInstance
{
    static NoteManagerHelper *sharedInstance;
    static dispatch_once_t done;
    dispatch_once(&done, ^{
        sharedInstance = [[NoteManagerHelper alloc] init]; });
    return sharedInstance;
}


-(void)saveCD
{
    NSError *err = nil;
    [[[NoteManager sharedInstance] managedObjectContext] save:&err];
    
    if (err != nil)
    {
        ALog(@"Error saving managed object context: %@", err);
    }
    
}


- (void)AddNewNote:(NSDictionary *)params
{
    
    NSManagedObject *m = [NSEntityDescription insertNewObjectForEntityForName:kNotes
                                                       inManagedObjectContext:[[NoteManager sharedInstance] managedObjectContext]];
    [m setValuesForKeysWithDictionary:params];
    
    [self saveCD];
    
    
}

- (NSArray *)getNotes
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:kNotes];
    //request.predicate = [NSPredicate predicateWithFormat:@"(user==%@)",user];
    
    
    NSError *error = nil;
    NSArray *foundCat = [[[NoteManager sharedInstance] managedObjectContext] executeFetchRequest:request error:&error];
    
    return foundCat;
}


- (void)deleteCategory:(Task *)obj;
{
    [[[NoteManager sharedInstance] managedObjectContext] deleteObject:obj];
    [self saveCD];
    
}
@end
