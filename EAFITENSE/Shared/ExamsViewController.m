//
//  GradesViewController.m
//  EAFITENSE
//
//  Created by Sergio Botero on 6/13/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import "ExamsViewController.h"

@implementation ExamsViewController

@synthesize dataArray;

- (id) init {
	return [self initWithStyle:UITableViewStyleGrouped];
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
		
		dataArray = [[NSMutableArray alloc]init];
		spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        // Custom initialization
	}
    return self;
}

- (void)dealloc
{
	[spinner release];
	[dataArray release];
    [super dealloc];
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
	[self loadInformation];
}

- (void) loadInformation {	
	[SBServiceCentral fetchResource:SBServiceCentralExams withTarget:self];
	UIBarButtonItem * spinnerBar = [[UIBarButtonItem alloc] initWithCustomView:spinner];
	[self.navigationItem setRightBarButtonItem:spinnerBar];
	[spinnerBar release];
	[spinner startAnimating];
}

- (void) showRefreshbutton {
	UIBarButtonItem * refreshBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(loadInformation)];
	[self.navigationItem setRightBarButtonItem:refreshBar];
	[refreshBar release];
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
		return [[[dataArray objectAtIndex:section] objectForKey:@"examinations"] count];
	}
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NSDictionary * course = [dataArray objectAtIndex:indexPath.section];
	NSArray * currentGrades = [course objectForKey:@"examinations"];
	
	
    static NSString *CellIdentifier = @"GradeCell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
	[cell.textLabel setText:[[currentGrades objectAtIndex:indexPath.row] objectForKey:@"name"]];
	[[cell detailTextLabel] setText:[NSString stringWithFormat:@"%d%%",[[[currentGrades objectAtIndex:indexPath.row] objectForKey:@"date"]intValue]]];
	UILabel * markLabel = [[UILabel alloc] init];
	[markLabel setText:[NSString stringWithFormat:@"%.2f",[[[currentGrades objectAtIndex:indexPath.row] objectForKey:@"percentage"] floatValue]]];
	[markLabel sizeToFit];
	[cell setAccessoryView:markLabel];
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



- (void) finishedLoadingExams:exams {
	[dataArray setArray:exams];
	[[self tableView] reloadData];
	[spinner stopAnimating];
	[self showRefreshbutton];
}


@end
