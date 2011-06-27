//
//  GradesViewController.h
//  EAFITENSE
//
//  Created by Sergio Botero on 6/13/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBServiceCentral.h"

@interface GradesViewController : UITableViewController <SBServiceCentralDelegate>
{
	NSMutableArray * dataArray;
	//	NSOperationQueue * opQueue;
}

@property (nonatomic, retain) NSMutableArray * dataArray;

@end
