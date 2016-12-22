//
//  AppMethod.h
//  Runmileapp
//
//  Created by Tecksky Techonologies on 9/3/16.
//  Copyright © 2016 Tecksky Techonologies. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppMethod : NSObject

+(void)setStringDefault:(NSString*)key:(NSString*)value;
+(NSString*)getStringDefault:(NSString*)key;

+(NSString *)convertHTML:(NSString *)html;

+(void)setArrayDefault:(NSMutableArray*)key:(NSMutableArray*)value;
+(NSMutableArray*)getArrayDefault:(NSMutableArray*)key;

+(NSInteger)Check_Internet;
+(NSDictionary *)Parse_Adondata;
@end
