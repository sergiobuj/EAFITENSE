//
//  LasVegasViewController.m
//  EAFITENSE
//
//  Created by Sergio Botero on 4/24/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import "LasVegasViewController.h"
#import "RSSFeed.h"
#import "CampusMap.h"

enum {
	ulises_tag,
	map_tag,
	news_tag
};

@implementation LasVegasViewController
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
    }
    return self;
}*/


- (id) init {
	self = [super init];
	if (self) {
		[super viewDidLoad];

		newsFeed = [[RSSFeed alloc] initWithStyle:UITableViewStylePlain];
		campusMap = [[CampusMap alloc] init];

	}
	return self;
}


- (void)dealloc
{
	[campusMap release];
	[newsFeed release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	UIView * cookingView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	
	CGFloat viewW = cookingView.frame.size.width;
	CGFloat viewH = cookingView.frame.size.height;
	
	UIButton * launchCampus = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[launchCampus setFrame:CGRectMake(viewW * 0.1, viewH * 0.1 , 20 , 20)];
	[launchCampus setTitle:NSLocalizedString(@"map_title", @"") forState:UIControlStateNormal];
	[launchCampus setTag:map_tag];
	[launchCampus sizeToFit];
	[launchCampus addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
	[cookingView addSubview:launchCampus];				
	
	UIButton * launchGrades = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[launchGrades setFrame:CGRectMake( viewW * 0.1 ,  viewH * 0.2, 20, 20)];
	[launchGrades setTitle:NSLocalizedString(@"ulises_title", @"") forState:UIControlStateNormal];
	[launchGrades setTag:ulises_tag];
	[launchGrades sizeToFit];
	[launchGrades addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
	[cookingView addSubview:launchGrades];
	
	
	UIButton * launchFeed = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[launchFeed setFrame:CGRectMake( viewW * 0.1 ,  viewH * 0.3, 20, 20)];
	[launchFeed setTitle:NSLocalizedString(@"news_title", @"") forState:UIControlStateNormal];
	[launchFeed setTag:news_tag];
	[launchFeed sizeToFit];
	[launchFeed addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
	[cookingView addSubview:launchFeed];
	
	
	[self setView:cookingView];

	[cookingView release];
	
	[self showModal:self];	
	
}


- (void) showModal:(id)sender{
	
	ModalViewLogin *stc  = [[ModalViewLogin alloc] init];
	stc.delegate = self;
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:stc];
	[self.navigationController presentModalViewController:navController animated:YES];
	self.navigationItem.prompt = nil;
	[navController release];
	[stc release];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{

}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void) buttonPressed:(id)sender {

	switch ([sender tag]) {
		case news_tag:
			[self.navigationController pushViewController:newsFeed animated:YES];
			//			NSLog(@"tag:%d", news_tag);
			break;
			
		case ulises_tag:
			NSLog(@"tag:%d", ulises_tag);
			break;
			
			
		case map_tag:
			[self.navigationController pushViewController:campusMap animated:YES];
			//			NSLog(@"tag:%d", map_tag);
			break;
			
		default:
			break;
	}
	
}



#pragma mark -
#pragma mark ModalViewDelegate Methods
- (void) loginWithUsername:(NSString *) username andPass:(NSString *)password {

	NSLog(@"username");
	if ([username isEqualToString:@"Pow"]) {
		[self dismissModalViewControllerAnimated:YES];		
	}else{
		UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"" otherButtonTitles:@"", nil];
		[alert show];
		[alert release];
	}

}

- (void) loginCancelled {

	NSLog(@"cancelled");

}

@end
