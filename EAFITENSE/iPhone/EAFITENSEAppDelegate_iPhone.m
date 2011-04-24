//
//  EAFITENSEAppDelegate_iPhone.m
//  EAFITENSE
//
//  Created by Sergio Botero on 4/24/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import "EAFITENSEAppDelegate_iPhone.h"
#import "RSSFeed.h"

@implementation EAFITENSEAppDelegate_iPhone


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	RSSFeed * newFeed = [[RSSFeed alloc] initWithStyle:UITableViewStylePlain];
	[self.window addSubview:newFeed.view];
	[newFeed release];
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
	[super dealloc];
}

@end
