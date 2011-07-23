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
		// Custom initialization
		dataArray = [[NSMutableArray alloc] init];
		spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
		//	[self.tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"icon.png"]]];
		//	[self.tableView setSeparatorColor:[UIColor clearColor]];
		//  [self.view setBackgroundColor:[UIColor clearColor]];
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
	[SBServiceCentral fetchResource:SBServiceCentralGrades withTarget:self];
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
		[cell.textLabel setText:[[currentGrades objectAtIndex:indexPath.row] objectForKey:@"exam_name"]];
		[[cell detailTextLabel] setText:[NSString stringWithFormat:@"%d%%",[[[currentGrades objectAtIndex:indexPath.row] objectForKey:@"exam_percentage"]intValue]]];
		UILabel * markLabel = [[UILabel alloc] init];
		[markLabel setText:[NSString stringWithFormat:@"%.2f",[[[currentGrades objectAtIndex:indexPath.row] objectForKey:@"exam_grade"] floatValue]]];
		[markLabel sizeToFit];
		[cell setAccessoryView:markLabel];
		[markLabel release];
	}else{
		
		float totalPercentage = 0;
		float gradeXpercetnage = 0;
		float gradeToPass = [[course objectForKey:@"grade_to_pass"] floatValue];
		float gradeNeeded = 0;
		
		for (id singleGrade in currentGrades) {
			totalPercentage += [[singleGrade objectForKey:@"exam_percentage"] floatValue];
			gradeXpercetnage += ([[singleGrade objectForKey:@"exam_percentage"] floatValue] /100)* [[singleGrade  objectForKey:@"exam_grade"] floatValue];
		}

		gradeNeeded = (gradeToPass - gradeXpercetnage)/(1 - (totalPercentage)/100);
		

		[cell.textLabel setText:[NSString stringWithFormat:NSLocalizedString(@"grade_needed_title", @"title for grade needed cell"),gradeToPass]];
		[cell.detailTextLabel setText:[NSString stringWithFormat:NSLocalizedString(@"percentage_left_with_int", @"needs %d to show percentage left"), (int)(100 - totalPercentage) ]];
		UILabel * markLabel = [[UILabel alloc] init];
		[markLabel setText:[NSString stringWithFormat:@"%.2f", gradeNeeded]];
		[markLabel sizeToFit];
		[cell setAccessoryView:markLabel];
		[markLabel release];
	}

    [cell setUserInteractionEnabled:NO];
	return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if ([dataArray count] > 0) {
		return [[dataArray objectAtIndex:section] objectForKey:@"title"];
	}
	return [NSString stringWithFormat:NSLocalizedString(@"loading", @"when grades haven't arrived")];
}


#pragma mark - Table view delegate



- (void) finishedLoadingGrades:(NSArray *)grades {
	[dataArray setArray:grades];
	[[self tableView ] reloadData];
	[spinner stopAnimating];
	[self showRefreshbutton];
}


@end
