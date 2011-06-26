//
//  SBServiceCentral.h
//  EAFITENSE
//
//  Created by Sergio Botero on 6/26/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJSONDeserializer.h"
#import "SBPlistReader.h"

@protocol SBServiceCentralDelegate <NSObject>

extern enum{
	SBServiceCentralExams = 0,
	SBServiceCentralGPA,
	SBServiceCentralGrades,
	SBServiceCentralSchedule
};

@optional
-(void) finishedLoadingGrades:(NSArray *) grades;
-(void) finishedLoadingSchedule:(NSArray *) schedule;
-(void) finishedLoadingGPA:(NSDictionary *) gpaInfo;
-(void) finishedLoadingExams:(NSArray *) exams;

@end


@interface SBServiceCentral : NSObject {
    
}

+ (void) fetchResource:(int)resource withTarget:(id) delegate;

@end
