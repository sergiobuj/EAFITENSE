//
//  ExamsViewController.h
//  EAFITENSE
//
//  Created by Sergio Botero on 6/26/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBServiceCentral.h"

@interface ExamsViewController : UITableViewController <SBServiceCentralDelegate>{
    
	NSMutableArray * dataArray;
}

@property (nonatomic, retain) NSMutableArray * dataArray;

@end