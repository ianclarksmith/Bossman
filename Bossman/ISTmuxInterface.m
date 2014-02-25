//
//  ISTmuxInterface.m
//  Bossman
//
//  Created by Ian Smith on 2/19/14.
//  Copyright (c) 2014 SUMISU. All rights reserved.
//

#import "ISTmuxInterface.h"

@implementation ISTmuxInterface

+ (NSString*)runTmux:(NSArray*)arguments {
    NSTask *task = [[NSTask alloc] init];
    NSString* tmuxPath = [[NSUserDefaults standardUserDefaults] objectForKey:@"TmuxPath"];
    [task setLaunchPath:tmuxPath];
    
    [task setCurrentDirectoryPath:@"~"];
    
    // NSArray *arguments = [NSArray arrayWithObjects:@"list", nil];
    [task setArguments:arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput:pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *string;
    string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    [task waitUntilExit];
    
    return string;
}

+ (NSString*)sendKeys:(NSString *)command {
    // Redo to ensure that strings are properly escaped
    return [self runTmux:@[@"send-keys", @"-t",
                           [[NSUserDefaults standardUserDefaults] objectForKey:@"TmuxSession"], command, @"Enter"]];
}

@end
