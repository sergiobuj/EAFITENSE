//
//  MapPoint.m
//  mapkit
//
//  Created by Sergio on 6/4/10.
//  Copyright 2010 sergiobuj. All rights reserved.
//

#import "MapPoint.h"


@implementation MapPoint

@synthesize title;
@synthesize subtitle;
@synthesize coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D) location{
	coordinate = location;	
	return self;
}

@end
