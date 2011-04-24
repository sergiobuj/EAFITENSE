//
//  EAFITENSEAppDelegate_iPhone.m
//  EAFITENSE
//
//  Created by Sergio Botero on 4/24/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import "EAFITENSEAppDelegate_iPhone.h"
#import "LasVegasViewController.h"

@implementation EAFITENSEAppDelegate_iPhone


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{	
	LasVegasViewController * viewController = [[LasVegasViewController alloc] init];
	mainEntrance = [[UINavigationController alloc] initWithRootViewController:viewController];
	[viewController release];
	
	[self.window addSubview:mainEntrance.view];
	
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
	[mainEntrance release];
	[super dealloc];
}

@end
