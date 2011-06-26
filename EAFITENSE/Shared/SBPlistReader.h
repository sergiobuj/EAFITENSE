//
//  SBPlistReader.h
//  
//
//  Created by Sergio Botero on 11/23/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SBPlistReader : NSObject {

}

+ (NSDictionary *) dictionaryForResource:(NSString *) resource fromPlist:(NSString *) plist;
+ (NSArray *) arrayForResource:(NSString *) resource fromPlist:(NSString *) plist;
+ (id) valueForResource:(NSString *) resource fromPlist:(NSString *)plist;

@end
