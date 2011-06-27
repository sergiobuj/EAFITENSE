//
//  SBServiceCentral.m
//  EAFITENSE
//
//  Created by Sergio Botero on 6/26/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import "SBServiceCentral.h"


@implementation SBServiceCentral


+ (void) fetchResource:(int)resource withTarget:(id) delegate {
	
	id data = nil;
	NSString * serviceURL = nil;
	switch (resource) {
		case SBServiceCentralGPA:
			serviceURL = [NSString stringWithString:@"gpa-service"];
			data = [[NSMutableDictionary alloc] init];
			break;
			
		case SBServiceCentralExams:
			if(!serviceURL) serviceURL = [NSString stringWithString:@"exams-service"];
		case SBServiceCentralGrades:
			if(!serviceURL) serviceURL = [NSString stringWithString:@"grades-service"];
		case SBServiceCentralSchedule:
			if(!serviceURL) serviceURL = [NSString stringWithString:@"schedule-service"];
			data = [[NSMutableArray alloc] init];
			break;
	}
	
	[[NSOperationQueue mainQueue] addOperationWithBlock:^{
		NSError * error = nil;
		NSString * resourceAsString = [NSString stringWithContentsOfURL:[NSURL URLWithString:[SBPlistReader valueForResource:serviceURL fromPlist:@"Customization"]] encoding:NSUTF8StringEncoding error:&error];
		if (error) {
			NSLog(@"%@", error);
		}else {
			NSData * jsonData = [resourceAsString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
			
			switch (resource) {
				case SBServiceCentralGPA:
					[data setDictionary:[[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error]];
					break;
					
				case SBServiceCentralExams:
				case SBServiceCentralGrades:
				case SBServiceCentralSchedule:
					[data setArray:[[CJSONDeserializer deserializer] deserializeAsArray:jsonData error:&error]];
					break;
			}
		}
	
		
		
		switch (resource) {
			case SBServiceCentralExams:
				if ([delegate respondsToSelector:@selector(finishedLoadingExams:)]) {
					[delegate finishedLoadingExams:data];
				}
				break;
				
			case SBServiceCentralGrades:
				if ([delegate respondsToSelector:@selector(finishedLoadingGrades:)]) {
					[delegate finishedLoadingGrades:data];
				}
				break;
				
			case SBServiceCentralSchedule:
				if ([delegate respondsToSelector:@selector(finishedLoadingSchedule:)]) {
					[delegate finishedLoadingSchedule:data];
				}
				break;
				
			case SBServiceCentralGPA:
				if ([delegate respondsToSelector:@selector(finishedLoadingGPA:)]) {
					[delegate finishedLoadingGPA:data];
				}
				break;
		}

	}];
}

@end