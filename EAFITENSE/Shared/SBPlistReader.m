//
//  SBPlistReader.m
//
//
//  Created by Sergio Botero on 11/23/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "SBPlistReader.h"


@implementation SBPlistReader

+ (NSDictionary *) dictionaryForResource:(NSString *) resource fromPlist:(NSString *) plist{
	NSString *path = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
	NSDictionary * plistDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
	
	NSDictionary *resultDictionary = [[NSDictionary alloc] initWithDictionary:[plistDictionary objectForKey:resource]];
	return [resultDictionary autorelease];
}

+ (NSArray *) arrayForResource:(NSString *) resource fromPlist:(NSString *) plist{
	NSString *path = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
	NSDictionary * plistDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
	
	NSArray *resultArray = [[NSArray alloc] initWithArray:[plistDictionary objectForKey:resource]];
	return [resultArray autorelease];
}


+ (id) valueForResource:(NSString *) resource fromPlist:(NSString *)plist{
	
	NSString *path = [[NSBundle mainBundle] pathForResource:plist ofType:@"plist"];
	NSDictionary * plistDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
	
	return [[[plistDictionary objectForKey:resource] retain] autorelease];

}


@end
