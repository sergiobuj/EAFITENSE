//
//  CampusMap.h
//  iEAFIT
//
//  Created by Sergio Botero on 11/30/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapPoint.h"

@interface CampusMap : UIViewController <MKMapViewDelegate> {
	MKMapView * campusMapView;
	NSMutableArray *sitePoints;
}

- (void) getMapReady;

@end
