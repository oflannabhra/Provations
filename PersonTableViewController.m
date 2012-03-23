//
//  PersonViewController.m
//  ProvationsApp
//
//  Created by Ben Flannery on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PersonTableViewController.h"
#import "PersonDetailViewController.h"
#import "Person.h"

@interface PersonTableViewController ()

@end

@implementation PersonTableViewController
@synthesize people;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // set tab bar items
        self.title = @"Staff";
        
        self.people = [[NSMutableArray alloc] init];
        // Custom initialization
        // Read in Data from plist, put it in an array, and make it available to subviews
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        
        NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:filePath];
                
        NSArray *names = [NSArray arrayWithArray:[data objectForKey:@"Names"]];
        NSArray *titles = [NSArray arrayWithArray:[data objectForKey:@"Titles"]];
        NSArray *bios = [NSArray arrayWithArray:[data objectForKey:@"Bios"]];   
        
        // convert data[] to Persons in people[]
        
        for (int j = 0; j < names.count; j++) {
            
            Person *temp = [[Person alloc] initWithName:[names objectAtIndex:j]
        andTitle:[titles objectAtIndex:j]
        andBio:[bios objectAtIndex:j]];

            
            [self.people addObject:temp];
            NSLog(@"%@, %d", temp.name, self.people.count);
        }
    }  
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PersonCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    Person *temp = [self.people objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = temp.name;
    cell.detailTextLabel.text = temp.title;
    
    // take the name, cut off last name, and lowercase it
    
    NSString *imageName = [[[[temp.name componentsSeparatedByString:@" "] objectAtIndex:0] lowercaseString] stringByAppendingString:@"_thumb.png"];
    
    cell.imageView.image = [UIImage imageNamed:imageName];
    NSLog(@"%@", imageName);
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    PersonDetailViewController *personDetailViewController;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        personDetailViewController = [[PersonDetailViewController alloc] initWithNibName:@"PersonDetailViewController_iPhone" bundle:nil];
    } 
    else {
        personDetailViewController = [[PersonDetailViewController alloc] initWithNibName:@"PersonDetailViewController_iPad" bundle:nil];
    }    

    personDetailViewController.person = [self.people objectAtIndex:[indexPath row]];
    personDetailViewController.title = personDetailViewController.person.name;
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:personDetailViewController animated:YES];
}

@end
