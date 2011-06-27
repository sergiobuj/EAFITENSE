//
//  GradesViewController.m
//  EAFITENSE
//
//  Created by Sergio Botero on 6/13/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import "ScheduleViewController.h"

// Define number of cells per course
// The total amount of cell per section will be ( N + SCHEDULE_ADITIONAL_FIELDS)
// where N is the number of days with class of the course
#define SCHEDULE_ADITIONAL_FIELDS 3

// Define the number of cell that will precede the classes days cells
// This is based on the layout of UITableView and row number.
#define PRECEDING_CELL_TO_CLASS_DAYS 2

@implementation ScheduleViewController

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

- (void) viewDidLoad {
	[super viewDidLoad];
	[SBServiceCentral fetchResource:SBServiceCentralSchedule withTarget:self];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
	if ([dataArray count] > 0) {
		return [dataArray count];
	}
	
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if ([dataArray count] > 0) {
		// Return number of grades already assigned plus one to show the needed grade to pass
		return [[[dataArray objectAtIndex:section] objectForKey:@"days"] count] + SCHEDULE_ADITIONAL_FIELDS;
	}
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NSDictionary * course = [dataArray objectAtIndex:indexPath.section];
	NSArray * classes = [course objectForKey:@"days"];
	
	
    static NSString *CellIdentifier = nil;
	if (indexPath.row < 2) {
		CellIdentifier = @"EasyCell";
	} else if (indexPath.row == [classes count] + SCHEDULE_ADITIONAL_FIELDS -1) { //Zero Based
		CellIdentifier = @"DatesCell";
	} else {
		CellIdentifier = @"ClassCell";
	}
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		if ([CellIdentifier isEqualToString:@"EasyCell"]) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		} else if ([CellIdentifier isEqualToString:@"DatesCell"]){
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		}else if ([CellIdentifier isEqualToString:@"ClassCell"]){
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		}
    }
	
	
	UILabel * markLabel = [[UILabel alloc] init];
	if ([CellIdentifier isEqualToString:@"EasyCell"]) {
		
		if (indexPath.row == 0) {
			[cell.textLabel setText:NSLocalizedString(@"class_credits_title", @"title for number of credits for class")];
			[markLabel setText:[NSString stringWithFormat:@"%@", [course objectForKey:@"credits"]]];	
		} else {
			[cell.textLabel setText:NSLocalizedString(@"class_group_title", @"title for group class")];
			[markLabel setText:[NSString stringWithFormat:@"%@",[course objectForKey:@"group"]]];
		
		}
		[markLabel sizeToFit];
		[cell setAccessoryView:markLabel];

	} else if ([CellIdentifier isEqualToString:@"DatesCell"]){
		
		[cell.textLabel setText:NSLocalizedString(@"class_start_end_dates_title", @"Start and end date for course")];
		[[cell detailTextLabel] setText:[NSString stringWithFormat:@"%@ %@", [course objectForKey:@"start_date"],[course objectForKey:@"end_date"]]];
		
	}else if ([CellIdentifier isEqualToString:@"ClassCell"]){
		
		[cell.textLabel setText:[[classes objectAtIndex:indexPath.row - PRECEDING_CELL_TO_CLASS_DAYS] objectForKey:@"day"]];
		[[cell detailTextLabel] setText:[NSString stringWithFormat:@"%@ %@", [[classes objectAtIndex:indexPath.row -PRECEDING_CELL_TO_CLASS_DAYS] objectForKey:@"start_hour"], [[classes objectAtIndex:indexPath.row -PRECEDING_CELL_TO_CLASS_DAYS] objectForKey:@"end_hour"]]];
		[markLabel setText:[NSString stringWithFormat:@"%@", [[classes objectAtIndex:indexPath.row -PRECEDING_CELL_TO_CLASS_DAYS] objectForKey:@"number"]]];
		[markLabel sizeToFit];
		[cell setAccessoryView:markLabel];
	}
	[markLabel release];
	
    [cell setUserInteractionEnabled:NO];
	return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	//return [[dataArray objectAtIndex:section] objectForKey:@"title"];
	if ([dataArray count] > 0) {
		return [[dataArray objectAtIndex:section] objectForKey:@"title"];
	}
	return [NSString stringWithFormat:NSLocalizedString(@"loading", @"when grades haven't arrived")];
}


#pragma mark - Table view delegate

- (void) finishedLoadingSchedule:(NSArray *)schedule {
	[dataArray setArray:schedule];
	[[self tableView] reloadData];
}


@end
