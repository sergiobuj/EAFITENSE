//
//  GradesViewController.m
//  EAFITENSE
//
//  Created by Sergio Botero on 6/13/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import "GradesViewController.h"

@implementation GradesViewController

@synthesize dataArray;

- (id) init {
	return [self initWithStyle:UITableViewStyleGrouped];
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
		
		dataArray = [[NSMutableArray alloc]init];
        // Custom initialization
		    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	[SBServiceCentral fetchResource:SBServiceCentralGrades withTarget:self];
	
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
    // Return YES for supported orientations
	// return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
	if (dataArray) {
		return [dataArray count];
	}
	
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (dataArray) {
		// Return number of grades already assigned plus one to show the needed grade to pass
		return [[[dataArray objectAtIndex:section] objectForKey:@"current_grades"] count] + 1;
	}
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NSDictionary * course = [dataArray objectAtIndex:indexPath.section];
	NSArray * currentGrades = [course objectForKey:@"current_grades"];
	
	
    static NSString *CellIdentifier = @"GradeCell";
    if(indexPath.row > [currentGrades count]) CellIdentifier = @"NeededCell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
	if (indexPath.row < [currentGrades count] && [CellIdentifier isEqualToString:@"GradeCell"]) {
		[cell.textLabel setText:[[currentGrades objectAtIndex:indexPath.row] objectAtIndex:0]];
		[[cell detailTextLabel] setText:[NSString stringWithFormat:@"%d%%",[[[currentGrades objectAtIndex:indexPath.row] objectAtIndex:2]intValue]]];
		UILabel * markLabel = [[UILabel alloc] init];
		[markLabel setText:[NSString stringWithFormat:@"%.2f",[[[currentGrades objectAtIndex:indexPath.row] objectAtIndex:1] floatValue]]];
		[markLabel sizeToFit];
		[cell setAccessoryView:markLabel];

	}else{
		
		float totalPercentage = 0;
		float gradeXpercetnage = 0;
		float gradeToPass = [[course objectForKey:@"grade_to_pass"] floatValue];
		float gradeNeeded = 0;
		
		for (id singleGrade in currentGrades) {
			totalPercentage += [[singleGrade objectAtIndex:2] floatValue];
			gradeXpercetnage += ([[singleGrade objectAtIndex:2] floatValue] /100)* [[singleGrade objectAtIndex:1] floatValue];
		}

		gradeNeeded = (gradeToPass - gradeXpercetnage)/(1 - (totalPercentage)/100);
		
		///	NSLog(@"totPer %f  graXper %f  graPass %f  gradeNeeded %f", totalPercentage, gradeXpercetnage, gradeToPass, gradeNeeded);
		
		[cell.textLabel setText:[NSString stringWithFormat:NSLocalizedString(@"grade_needed_title", @"title for grade needed cell"),gradeToPass]];
		[cell.detailTextLabel setText:[NSString stringWithFormat:NSLocalizedString(@"percentage_left_with_int", @"needs %d to show percentage left"), (int)(100 - totalPercentage) ]];
		UILabel * markLabel = [[UILabel alloc] init];
		[markLabel setText:[NSString stringWithFormat:@"%.2f", gradeNeeded]];
		[markLabel sizeToFit];
		[cell setAccessoryView:markLabel];
	}

    [cell setUserInteractionEnabled:NO];
	return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	//return [[dataArray objectAtIndex:section] objectForKey:@"title"];
	if ([dataArray count] > 0) {
		return [[dataArray objectAtIndex:section] objectForKey:@"title"];
	}
	return [NSString stringWithFormat:NSLocalizedString(@"loading_grades", @"when grades haven't arrived")];
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
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

/*
- (void) fetchedGrades{
	NSLog(@"notas %@", jsonGrades);
	for(id key in jsonGrades){
		NSLog(@"ky:%@ obj:%@", key, [[jsonGrades objectForKey:key] objectForKey:@"title"]);
	}
}
 */


- (void) finishedLoadingGrades:(NSArray *)grades {
	[dataArray setArray:grades];
	[[self tableView] reloadData];

	//	NSLog(@"%@", NSStringFromSelector(_cmd));
}


@end
