//
//  AppMethod.m
//  Runmileapp
//
//  Created by Tecksky Techonologies on 9/3/16.
//  Copyright © 2016 Tecksky Techonologies. All rights reserved.
//

#import "AppMethod.h"
#import "Reachability.h"

@implementation AppMethod

+(void)setStringDefault:(NSString *)key :(NSString *)value
{
    [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}
+(NSString*)getStringDefault:(NSString *)key
{
    NSString *value=[[NSUserDefaults standardUserDefaults]stringForKey:key];
    return value;
}


//for address
+(NSString *)convertHTML:(NSString *)html
{
    
    NSScanner *myScanner;
    NSString *text = nil;
    myScanner = [NSScanner scannerWithString:html];
    
    while ([myScanner isAtEnd] == NO) {
        
        [myScanner scanUpToString:@"<" intoString:NULL] ;
        
        [myScanner scanUpToString:@">" intoString:&text] ;
        
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@"\n"];
    }
    html = [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return html;
}


+(void)setArrayDefault:(NSMutableArray *)key :(NSMutableArray *)value
{
    [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
+(NSMutableArray*)getArrayDefault:(NSMutableArray *)key
{
    NSMutableArray *value = [[NSUserDefaults standardUserDefaults]arrayForKey:key];
    return value;
}

+(NSInteger)Check_Internet;
{
    Reachability *IsReachable = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStats = [IsReachable currentReachabilityStatus];
    
    if (internetStats == NotReachable)
    {
        return 0;
    }
    else
    {
        return 1;
    }
}
+(NSDictionary *)Parse_Adondata
{
    NSString *json = [AppMethod getStringDefault:@"default_adon"];
    NSError *error;
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *adondata = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //NSDictionary *adondata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return adondata;
}
@end
