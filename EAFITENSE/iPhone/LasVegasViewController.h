//
//  LasVegasViewController.h
//  EAFITENSE
//
//  Created by Sergio Botero on 4/24/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewLogin.h"

@class RSSFeed, CampusMap;

@interface LasVegasViewController : UIViewController <ModalViewLoginDelegate> {
    
	RSSFeed * newsFeed;
	CampusMap * campusMap;
}

- (void) buttonPressed:(id) sender;
- (void) showModal:(id)sender;
@end
