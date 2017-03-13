//
//  ToDoViewController.m
//  ToDo
//
//  Created by Louise on 13/3/17.
//  Copyright © 2017 Louise. All rights reserved.
//

#import "ToDoViewController.h"
#import "NSString+Random.h"
#import "Task.h"

@interface ToDoViewController ()
@property (nonatomic,strong) NSArray *arrNotes;

@end

@implementation ToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self customizeHeader];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.arrNotes=[[NoteManagerHelper sharedInstance ] getNotes];
    self.arrNotes = [[self.arrNotes reverseObjectEnumerator] allObjects];

    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)customizeHeader
{
    [self.navigationController setNavigationBarHidden:NO];
    
    self.navigationItem.title = @"To Do List";
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    if ([self.navigationItem respondsToSelector:@selector(rightBarButtonItem)])
    {
        UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addList:)];
        self.navigationItem.rightBarButtonItem = rightBarButton;
        
        
    }
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

-(void)addList:(id) sender
{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"List"
                                          message:@"Enter TODO"
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action){
                                                  
                                                   UITextField *alertTextField = alertController.textFields.firstObject;

                                                   NSString *uID=[NSString randomAlphanumericStringWithLength:7];
                                                   NSMutableDictionary *dict=[NSMutableDictionary new];
                                                   dict[@"taskName"]=alertTextField.text;
                                                   dict[@"uniqueID"]=uID;
                                                   [[NoteManagerHelper sharedInstance ] AddNewNote:dict];
                                                   self.arrNotes=[[NoteManagerHelper sharedInstance ] getNotes];
                                                   self.arrNotes = [[self.arrNotes reverseObjectEnumerator] allObjects];

                                                   [self.tableView reloadData];
                                                   [alertController dismissViewControllerAnimated:YES completion:nil];


                                               }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       
                                                       NSLog(@"cancel btn");
                                                       
                                                       [alertController dismissViewControllerAnimated:YES completion:nil];
                                                       
                                                   }];
    
    [alertController addAction:cancel];
    [alertController addAction:ok];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"new task";
     }];
    
    [self presentViewController:alertController animated:YES completion:nil];

  
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrNotes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Task *taskIns =(Task *)[self.arrNotes objectAtIndex:indexPath.row];
    [cell.textLabel setText:taskIns.taskName];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Task *taskIns=(Task *)[self.arrNotes objectAtIndex:indexPath.row];
        [[NoteManagerHelper sharedInstance ] deleteCategory:taskIns];
        self.arrNotes=[[NoteManagerHelper sharedInstance ] getNotes];
        [self.tableView reloadData];

       // [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
