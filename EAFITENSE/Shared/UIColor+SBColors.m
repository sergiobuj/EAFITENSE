//
//  UIColor+SBColors.m
//  EAFITENSE
//
//  Created by Sergio Botero on 6/13/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import "UIColor+SBColors.h"

@implementation UIColor (SBColors)

+ (UIColor *) blueEAFIT {
	return [self colorWithRed:0.0/255.0 green:75.0/255.0 blue:133.0/255.0 alpha:1.0];
}

+ (UIColor *) goldEAFIT {
	return [self colorWithRed:255.0/255.0 green:185.0/255.0 blue:33.0/255.0 alpha:1.0];
}

+ (UIColor *) blueP50 {
	return [self colorWithRed:8.0/255.0 green:65.0/255.0 blue:122.0/255.0 alpha:1.0];
}

+ (UIColor *) yellowP50 {
	return [self colorWithRed:239.0/255.0 green:200.0/255.0 blue:75.0/255.0 alpha:1.0];
}

+ (UIColor *) redP50 {
	return [self colorWithRed:173.0/255.0 green:18.0/255.0 blue:37.0/255.0 alpha:1.0];
}

@end
