//
//  MapPoint.h
//  mapkit
//
//  Created by Sergio on 6/4/10.
//  Copyright 2010 sergiobuj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
}
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (id)initWithCoordinate:(CLLocationCoordinate2D) location;

@end
