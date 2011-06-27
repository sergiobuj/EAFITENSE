//
//  GPAViewController.m
//  EAFITENSE
//
//  Created by Sergio Botero on 6/26/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import "GPAViewController.h"


@implementation GPAViewController

@synthesize dataDictionary;

- (id) init {
	return [self initWithStyle:UITableViewStyleGrouped];
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
		dataDictionary = [[NSMutableDictionary alloc] init];
		spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    }
    return self;
}

- (void)dealloc
{
	[spinner release];
	[dataDictionary release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void) viewDidLoad {
	[super viewDidLoad];
	[[self tableView] setScrollEnabled:NO];
	[self loadInformation];
}

- (void) loadInformation {	
	[SBServiceCentral fetchResource:SBServiceCentralGPA withTarget:self];
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
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataDictionary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	UILabel * markLabel = [[UILabel alloc] init];
	switch (indexPath.row) {
		case 0:
			
			[cell.textLabel setText:NSLocalizedString(@"student_id", @"eafit's student id number")];
			//[cell.detailTextLabel setText:[dataDictionary objectForKey:@"student_id"]];
			[markLabel setText:[dataDictionary objectForKey:@"student_id"]];
			[markLabel sizeToFit];
			[cell setAccessoryView:markLabel];
			break;
			
		case 1:
			[cell.textLabel setText:NSLocalizedString(@"last_term", @"last term grade average")];
			[markLabel setText:[NSString stringWithFormat:@"%.2f",[[dataDictionary objectForKey:@"last_term"] floatValue]]];
			[markLabel sizeToFit];
			[cell setAccessoryView:markLabel];
			break;
			
		case 2:
			[cell.textLabel setText:NSLocalizedString(@"whole_degree_average", @"acumulated average of the degree")];
			[markLabel setText:[NSString stringWithFormat:@"%.2f",[[dataDictionary objectForKey:@"average"] floatValue]]];
			[markLabel sizeToFit];
			[cell setAccessoryView:markLabel];
			
			break;
			
		case 3:
			[cell.textLabel setText:NSLocalizedString(@"passed_credits", @"passed credits")];
			[markLabel setText:[NSString stringWithFormat:@"%d",[[dataDictionary objectForKey:@"passed_credits"] intValue]]];
			[markLabel sizeToFit];
			[cell setAccessoryView:markLabel];
			break;
			
		case 4:
			[cell.textLabel setText:NSLocalizedString(@"total_credits", @"total credits")];
			[markLabel setText:[NSString stringWithFormat:@"%d",[[dataDictionary objectForKey:@"total_credits"] intValue]]];
			[markLabel sizeToFit];
			[cell setAccessoryView:markLabel];
			break;
			
		default:
			break;
	}
	[markLabel release];
	
	
    [cell setUserInteractionEnabled:NO];
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if ([dataDictionary count] > 0) {
		return NSLocalizedString(@"student_gpa_info_title", @"title for student information");
	}
	return NSLocalizedString(@"loading", @"loading title for student information");

}

-(void) finishedLoadingGPA:(NSDictionary *)gpaInfo {
	[dataDictionary setDictionary:gpaInfo];
	[[self tableView] reloadData];
	[spinner stopAnimating];
	[self showRefreshbutton];
}

@end
