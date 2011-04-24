    //
//  CampusMap.m
//  iEAFIT
//
//  Created by Sergio Botero on 11/30/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "PlistReader.h"
#import "CampusMap.h"


@implementation CampusMap

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[self setTitle:NSLocalizedString(@"map_title", @"")];
	campusMapView = [[MKMapView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	[campusMapView setMapType:MKMapTypeStandard];
	[campusMapView setDelegate:self];

	
	sitePoints = [[NSMutableArray alloc] init];
	[self setView:campusMapView];
	[self getMapReady];
	
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[sitePoints release];
	[campusMapView release];
    [super dealloc];
}


- (void) getMapReady {
	NSArray * tempArray = [PlistReader arrayForResource:@"map_points" fromPlist:@"Customization"];

	for (NSDictionary *site in tempArray) {

		CLLocationCoordinate2D coord = {[[site objectForKey:@"latitude"] doubleValue], [[site objectForKey:@"longitude"] doubleValue]};

		MapPoint *pin = [[MapPoint alloc] initWithCoordinate:coord];

		[pin setTitle:[site objectForKey:@"title"]];
		
		[pin setSubtitle:[site objectForKey:@"subtitle"]];

		[sitePoints addObject:pin];
		
		[pin release];
	}
	
	///NSLog(@"number of pins %d",[sitePoints count]);
	

	[campusMapView addAnnotations:sitePoints];

    MKCoordinateSpan span = MKCoordinateSpanMake(0.004437 ,0.003433);
    MKCoordinateRegion region = MKCoordinateRegionMake([[sitePoints objectAtIndex:0] coordinate], span);
    
    [campusMapView setRegion:region animated:YES];
}


#pragma mark -
#pragma mark MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {


}


- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {

	[[UIScreen mainScreen] scale];
	
/*/	0.001093 0.000846
if ([campusMapView region].span.latitudeDelta <=  0.005331 || [campusMapView region].span.longitudeDelta <=  0.004125) {
		
		MKCoordinateRegion region = [campusMapView region];
		region.span = MKCoordinateSpanMake(0.001117 ,0.000865);
		[campusMapView setRegion:region animated:NO];
		
	}
*/	
//	NSLog(@"\nlat=%f lon=%f", [campusMapView region].span.latitudeDelta, [campusMapView region].span.longitudeDelta);

}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {}
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {}

// mapView:viewForAnnotation: provides the view for each annotation.
// This method may be called for all or some of the added annotations.
// For MapKit provided annotations (eg. MKUserLocation) return nil to use the MapKit provided annotation view.
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation { return nil; }

// mapView:didAddAnnotationViews: is called after the annotation views have been added and positioned in the map.
// The delegate can implement this method to animate the adding of the annotations views.
// Use the current positions of the annotation views as the destinations of the animation.
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {}

// mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls.
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {}

@end
